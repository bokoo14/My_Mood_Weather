//
//  WeatherViewModel.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/15.
//

import Foundation

class WeatherViewModel: ObservableObject {
    // property
    // published wrapper는 @State와 비슷하게 상태값을 선언, class안에서는 @Published를 사용한다는 점이 다름
    // @Published는 배열의 값이 View에서 변경이 되면 Model에서 새로운 변경사항을 알아차려서 변경함
    @Published var weatherArray: [WeatherModel] = []
    
    // 현재 선택된 index를 나타내는 변수
    @Published var weatherIndex: Int = 0
    
    init(){
        getWeather()
    }
    
    // weather
    func getWeather() {
        // weather의 각각의 값 선언
        let cloudy = WeatherModel(name: "Cloudy☁️", imageName: "Cloudy")
        let drizzle = WeatherModel(name: "Drizzle🌦️", imageName: "Drizzle")
        let fog = WeatherModel(name: "Fog🌫️", imageName: "Fog")
        let heavysnow = WeatherModel(name: "Heavy Snow🌨️", imageName: "HeavySnow")
        let lightning = WeatherModel(name: "Lightning⚡️", imageName: "Lightning")
        let raining = WeatherModel(name: "Raining🌧️", imageName: "Raining")
        let snow = WeatherModel(name: "Snow⛄️", imageName: "Snow")
        let suddenshower = WeatherModel(name: "Sudden Shower🌧️🌧️🌧️", imageName: "SuddenShower")
        let sunny = WeatherModel(name: "Sunny☀️", imageName: "Sunny2")
        let typoon = WeatherModel(name: "Typoon🌪️", imageName: "Typoon")
        
        // weatherArray에 weather저장
        self.weatherArray.append(cloudy)
        self.weatherArray.append(drizzle)
        self.weatherArray.append(fog)
        self.weatherArray.append(heavysnow)
        self.weatherArray.append(lightning)
        self.weatherArray.append(raining)
        self.weatherArray.append(snow)
        self.weatherArray.append(suddenshower)
        self.weatherArray.append(sunny)
        self.weatherArray.append(typoon)
    }
    
    // "<"버튼을 누르면 index를 1 감소시킴
    func leftWeather(index: Int){
        self.weatherIndex = (index - 1 + weatherArray.count) % weatherArray.count
    }
    
    // ">"버튼을 누르면 index를 1 증가시킴
    func rightWeather(index: Int){
        self.weatherIndex = (index + 1) % weatherArray.count
    }
}
