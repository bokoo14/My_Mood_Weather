//
//  WeatherInfoView.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/16.
//

import SwiftUI

struct WeatherInfoView: View {
    // property
    // @StateObject에서 선언한 viewModel을 @EnvironmentObject를 통해 가져오기
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    // property - binding
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                ScrollView {
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .padding()
                        }
                        Spacer()
                    }
                    CustomText(value: weatherViewModel.weatherArray[weatherViewModel.weatherIndex].information, fontSize: 30, color: Color.black)
                        .font(.system(size: 30))
                        .padding(30)
                    
                }
                
            }
        }
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(WeatherViewModel()) // environmentObject가 강제적으로 WeatherViewModel임을 알려줌
    }
}
