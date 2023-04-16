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
    
    
    // 날씨에 대한 information
    let cloudInfo: String = "Cloudy weather is when there are many clouds in the sky, making it difficult to see the sun or moon directly. \nThe cause of cloudy weather is the formation of clouds, which are a collection of water droplets or ice crystals that float in the air due to water vapor in the atmosphere. \nCloudy weather is usually caused by a front moving from south to north. \nThick clouds at high altitudes move down to lower layers, creating even thicker clouds and resulting in cloudy weather. \nCloudy weather can cause enough water droplets or ice crystals in the atmosphere to result in rain or snow. \nIf cloudy weather is sustained, the amount of sunlight decreases, causing the temperature to drop. \nTypes of cloudy weather include slightly cloudy, moderately cloudy, heavily cloudy, and overcast."
    let drizzleInfo: String = "Drizzle is lighter and consists of smaller raindrops compared to rain. \nSometimes, drizzle can fall in greater quantities than rain. \nDrizzle is typically associated with rainy weather, and it is more likely to occur when the wind is less strong than when it is raining. \nDrizzle can occur when cold and warm air masses collide. \nWhen it is drizzling, roads are less slippery than when it is raining, which can make driving safer."
    let fogInfo: String = "Fog is a weather phenomenon that occurs when the air is humid and the temperature is low, and water vapor condenses into tiny water droplets or ice crystals between the ground and the air, significantly reducing visibility. \nFog is a liquid form of atmospheric moisture that reduces visibility by suspending water droplets or ice crystals in the air. \nIn some cases, a light drizzle may occur as well."
    let heavySnowInfo: String = "The Korea Meteorological Administration defines heavy snowfall as the phenomenon of snowfall of 5cm or more per hour. \nWhen heavy snowfall is expected, various measures may be taken, such as flight cancellations, traffic control, and damage prevention. \nHeavy snowfall occurs when the temperature is below 0 degrees Celsius, and it is recommended to stay indoors as the temperature drops. \nDuring heavy snowfall, traffic volume decreases, making it a good time for activities such as walking, skiing, and snowboarding. \nAs snow accumulates during prolonged heavy snowfall, snow removal work is necessary. \nIf snow removal work is not properly done, there is a risk of slipping and getting injured, so caution is necessary."
    let ligttningInfo: String = "Lightning is a phenomenon where an uneven charge in the atmosphere is discharged to relieve the imbalance, and it is composed of an electrical discharge between a negative and a positive pole. \nLightning usually occurs with rain and comes with the sound of thunder. \nWhen lightning strikes the ground, it can cause an electric shock and have considerable destructive power. \nLightning is generally more likely to occur as the temperature increases and is most frequent in the summer. \nIn addition, lightning is more likely to occur in high-altitude areas. \nWhen lightning occurs, it is necessary to move to a safe place, and outdoors, it is advisable to take shelter in a safe place such as a subway or building."
    let rainingInfo: String = "Rain is a phenomenon where water droplets that have condensed from water vapor in the atmosphere fall to the ground. \nRain patterns vary depending on climate and season. In the summer, there can be heavy rain accompanied by thunder and lightning, while in the winter, rain may fall along with snow. Rain is typically caused by clouds becoming heavy and releasing their water droplets to the ground. \nHowever, there are other mechanisms that can cause rain as well. For example, in mountainous areas, rain can be caused by sudden temperature changes due to the terrain."
    let snowInfo: String = "Snow often occurs in areas where the temperature is below zero degrees Celsius. As the temperature drops, snow crystals grow larger and the amount of snowfall increases. \nSnow is made almost entirely of pure water, and when it melts, it becomes liquid water. The melting time of snow depends on how much snowfall there is. \nSnow frequently occurs with a developed high-pressure system. High-pressure systems suppress rising air currents in the atmosphere, causing water vapor to condense and freeze, resulting in snow"
    let suddenShowerInfo: String = "A sudden shower is when there is a sudden and heavy downpour of rain, causing the ground to quickly become flooded. \nSudden showers can impact traffic on roads because of the heavy rainfall in a short period. Sudden showers are often accompanied by thunder and lightning. \nDue to the suddenness of a sudden shower, it is important to have protection like an umbrella or raincoat. Sudden showers can occur with a sudden drop in temperature or strong winds."
    let sunnyInfo: String = "Cloudy weather is when there are many clouds in the sky, making it difficult to see the sun or moon directly. \nThe cause of cloudy weather is the formation of clouds, which are a collection of water droplets or ice crystals that float in the air due to water vapor in the atmosphere. Cloudy weather is usually caused by a front moving from south to north. Thick clouds at high altitudes move down to lower layers, creating even thicker clouds and resulting in cloudy weather. Cloudy weather can cause enough water droplets or ice crystals in the atmosphere to result in rain or snow. \nIf cloudy weather is sustained, the amount of sunlight decreases, causing the temperature to drop. \nTypes of cloudy weather include slightly cloudy, moderately cloudy, heavily cloudy, and overcast."
    let typoonInfo: String = "The Korea Meteorological Administration issues forecasts and warnings for typhoons based on the location of occurrence, path, and intensity. \nTyphoons generally originate from the sea and cause strong winds, heavy rain, strong waves, and flooding as they move over land. \nThe growth and path of a typhoon are closely related to global warming, and predicting the intensity and path of a typhoon is difficult, so it is important to prepare in advance to prevent damage. \nWhen a typhoon occurs, it is safer to stay indoors as much as possible, and to avoid dangerous areas such as areas with strong winds, low-lying areas, coasts, and rivers."
    
    
    init(){
        getWeather()
    }
    
    // weather
    func getWeather() {
        // weather의 각각의 값 선언
        let cloudy = WeatherModel(name: "Cloudy☁️", imageName: "Cloudy", information: cloudInfo)
        let drizzle = WeatherModel(name: "Drizzle🌦️", imageName: "Drizzle", information: drizzleInfo)
        let fog = WeatherModel(name: "Fog🌫️", imageName: "Fog", information: fogInfo)
        let heavysnow = WeatherModel(name: "Heavy Snow🌨️", imageName: "HeavySnow", information: heavySnowInfo)
        let lightning = WeatherModel(name: "Lightning⚡️", imageName: "Lightning", information: ligttningInfo)
        let raining = WeatherModel(name: "Raining🌧️", imageName: "Raining", information: rainingInfo)
        let snow = WeatherModel(name: "Snow⛄️", imageName: "Snow", information: snowInfo)
        let suddenshower = WeatherModel(name: "Sudden Shower🌧️🌧️🌧️", imageName: "SuddenShower", information: suddenShowerInfo)
        let sunny = WeatherModel(name: "Sunny☀️", imageName: "Sunny", information: sunnyInfo)
        let typoon = WeatherModel(name: "Typoon🌪️", imageName: "Typoon", information: typoonInfo)
        
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
