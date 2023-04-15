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
    // @StateObject를 사용하여 ViewModel 객체화하기 -> View가 처음 생성
    @StateObject var weatherViewModel = WeatherViewModel()
    
    
    var body: some View {
        ZStack {
            // background color
            backgroundColor.ignoresSafeArea()
            Image("SketchBook") // 날씨 이미지
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].imageName) // 스케치북 이미지
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                Text("My Mood Weather is ..\n \(weatherViewModel.weatherArray[weatherViewModel.weatherIndex].name)")
                    .frame(width: 1000, height: 200, alignment: .center)
                    .font(.system(size: 70))
                    .foregroundColor(.black)
                    .background(Color.customGray.opacity(0.75))
                    .cornerRadius(20)
                    .padding(.top, 100)
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
                }
                
                
                HStack {
                    // move image to left index image
                    Button {
                        weatherViewModel.leftWeather(index: weatherViewModel.weatherIndex)
                    } label: {
                        Text("⬅️")
                            .font(.system(size: 80))
                    }
                    .padding(.horizontal, 15)
                    Spacer()
                    Button {
                        // move image to right index image
                        weatherViewModel.rightWeather(index: weatherViewModel.weatherIndex)
                    } label: {
                        Text("➡️")
                            .font(.system(size: 80))
                    }
                    .padding(.horizontal, 15)
                }
                Spacer()
            }
            
        }
    }
}

struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
