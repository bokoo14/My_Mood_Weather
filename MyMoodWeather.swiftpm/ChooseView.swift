//
//  ChooseView.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/13.
//

import SwiftUI

struct ChooseView: View {
    // property
    @State var backgroundColor: Color = .white
    @State var showWeatherInformation: Bool = false
    
    // @StateObject를 사용하여 ViewModel 객체화하기 -> View가 처음 생성
    @StateObject var weatherViewModel = WeatherViewModel()
    
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
                Text("My Mood Weather is ..\n \(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].name)")
                    .frame(width: 1000, height: 200, alignment: .center)
                    .font(.system(size: 70))
                    .foregroundColor(.black)
                    .background(Color.customGray.opacity(0.75))
                    .cornerRadius(20)
                    .padding(.top, 90)
                    .padding(.bottom, 60)
                    .multilineTextAlignment(.center) // 글씨 가운데 정렬
                
                // ColorPicker
                HStack {
                    Spacer()
                    ColorPicker(selection: $backgroundColor, supportsOpacity: true) {
                        Text("Express your mood color")
                    }
                    .padding()
                    .background(Color.customGray)
                    .cornerRadius(20)
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(width: 350, height: 20)
                    .padding(.trailing, 85)
                } // : HStack - ColorPicker
                
                Spacer()
                HStack{
                    Button {
                        showWeatherInformation.toggle()
                    } label: {
                        Text("What is \(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].name)?")
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
    } 
}

struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
