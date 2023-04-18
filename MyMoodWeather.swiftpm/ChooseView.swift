//
//  ChooseView.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/13.
//

import SwiftUI
import AVFoundation
import Combine

struct ChooseView: View {
    // property
    @State var backgroundColor: Color = .white
    @State var showWeatherInformation: Bool = false
    
    // @StateObject를 사용하여 ViewModel 객체화하기 -> View가 처음 생성
    @StateObject var weatherViewModel = WeatherViewModel()
    @StateObject var musicPlayer = MusicPlayer()
    // weatherViewModel의 name, imageName
    @State var weatherName: String = ""
    @State var weatherImageName: String = ""
    
    
    var body: some View {
        ZStack {
            // background color
            backgroundColor.ignoresSafeArea()
            Image("SketchBook") // 스케치북 이미지
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].imageName) // 날씨 이미지
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // HStack - left, right Button
            HStack {
                // move image to left index image
                Button {
                    weatherViewModel.leftWeather(index: weatherViewModel.weatherIndex)
                    musicPlayer.stopMusic()
                    musicPlayer.playMusic(name: weatherViewModel.weatherArray[weatherViewModel.weatherIndex].musicName)
                } label: {
                    Image(systemName: "chevron.left.square")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 15)
                Spacer()
                Button {
                    // move image to right index image
                    weatherViewModel.rightWeather(index: weatherViewModel.weatherIndex)
                    musicPlayer.stopMusic()
                    musicPlayer.playMusic(name: weatherViewModel.weatherArray[weatherViewModel.weatherIndex].musicName)
                } label: {
                    Image(systemName: "chevron.right.square")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 15)
            } // : HStack - left, right button
            
            
            VStack{
                // Title Text - My Mood Weather is ..
                CustomText(value: "My Mood Weather is ..\n \(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].name)", fontSize: 70, color: Color.black)
                    .frame(width: 1000, height: 200, alignment: .center)
                    .background(Color.customGray.opacity(0.75))
                    .cornerRadius(20)
                    .padding(.top, 90)
                    .padding(.bottom, 30)
                    .multilineTextAlignment(.center) // 글씨 가운데 정렬
                
                // ColorPicker
                HStack {
                    Spacer()
                    Button {
                        musicPlayer.playMusic(name: weatherViewModel.weatherArray[weatherViewModel.weatherIndex].musicName)
                    } label: {
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    } // : Music Stop Button
                    
                    
                    Button {
                        musicPlayer.stopMusic()
                    } label: {
                        Image(systemName: "pause.rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    } // : Music Stop Button
                    
                    ColorPicker(selection: $backgroundColor, supportsOpacity: true) {
                        CustomText(value: "Express your mood color", fontSize: 23, color: Color.black)
    
                    }
                    .padding()
                    .background(Color.customGray)
                    .cornerRadius(20)
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(width: 350, height: 20)
                    .padding(.trailing, 85)
                    .padding(.horizontal, 20)
                } // : HStack - ColorPicker
                
                Spacer()
                HStack{
                    Button {
                        showWeatherInformation.toggle()
                    } label: {
                        CustomText(value: "What is \(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].name)?", fontSize: 30, color: Color.white)
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .frame(width: 450, height: 50)
                            .padding(10)
                            .background(.black)
                            .cornerRadius(20)
                            .padding(.horizontal, 80)
                            .padding(.vertical, 30)
                    } // : Button
                    .sheet(isPresented: $showWeatherInformation) {
                        WeatherInfoView()
                            .environmentObject(weatherViewModel)
                        // 하위 뷰에 weatherViewModel을 environmentObject로 넘겨줌
                    }
                    Spacer()
                } // : HStack - What is weather button
                
            } // : VStack - Text, ColorPicker, Button
            
        } // : ZStack
        .onAppear {
            print("음악 재생")
            musicPlayer.stopMusic()
            musicPlayer.playMusic(name: weatherViewModel.weatherArray[weatherViewModel.weatherIndex].musicName)
        }
    } 
}

struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
