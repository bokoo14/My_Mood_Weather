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
    let cloudInfo: String = "Cloudy weather is the weather where the sky is covered with clouds. It is recommended to bring an umbrella because such cloudy weather is likely to rain. However, cloudy weather may not feel good because the light is dark. \nThis cloudy weather can be linked to 'depressed😔' and 'weapless😪' emotions."
    let drizzleInfo: String = "It's a bit of rain, and it sometimes ends with sudden rain like a shower. These raindrops are good for enjoying the scenery because it rains moderately, and it is also a good weather for taking a walk while listening to the sound of rain. These sonar rain can be associated with emotions such as 'warm🙂', 'relaxation☺️', and 'peace🤟🏻'."
    let fogInfo: String = "Fog is the weather in which droplets of water float in the air blocking the view. These fogs can be dangerous to drive or walk because light is absorbed and the visibility narrows. \nHowever, fog can be associated with feelings of 'calm🤫', 'mysterious🤔', and 'quiet atmosphere🤐' because it creates a calm and calm atmosphere."
    let heavySnowInfo: String = "Heavy snow means a lot of snow falling at once. You can enjoy playing such as making a snowman or snowball fight, but it can affect the length of the vehicle or the operation of the vehicle. When it snows, children are excited and excited, so they have fun while having snowball fights or making snowmen. The corresponding emotion is ‘excitement.😊’"
    let ligttningInfo: String = "The phenomenon of flashing electricity in the sky. When lightning strikes, it makes a loud noise with flashing lights. So it can be ‘threatening👹’ and ‘scary😨’"
    let rainingInfo: String = "Rain means falling in the form of water droplets from a cloud. You have to be careful because the ground gets wet and slippery when it rains. Children can be disappointed and depressed because they cannot enjoy outdoor activities when it rains. The corresponding emotions are 'disappointment🫤' and 'depression☹️'."
    let snowInfo: String = "Snow means snow on the ground, similar to heavy snow, but it is less heavy and more likely to get colder than rain. It is important to wear warm clothes to enjoy snow play. When it snows, children feel excited and happy, making snowmen and having snowball fights.The corresponding emotion is 'excitement😆'"
    let suddenShowerInfo: String = "A shower is a phenomenon in which rain suddenly falls hard. It's important to take an umbrella or raincoat because it rains hard, so your hair can get twisted and your clothes can get wet. Sudden showers can surprise children and make them anxious. The corresponding emotion is 'surprise😮'"
    let sunnyInfo: String = "Sunny is weather with few clouds and clear skies and sunny sunshine. This clear weather is very sunny and pleasant with a lot of sunlight. \nSuch clear weather can be associated with 'happy😄' emotions."
    let typoonInfo: String = "Lightning is the weather in which lightning flashes among clouds, usually with storms. These lightning strikes can create impressive landscapes in a flame-like form, but they can also be heard thundering at the same time, so you may feel scared. These lightning strikes can be associated with emotions such as 'fear😰', 'danger😱', and 'anxiety😮‍💨'"
    
    
    init(){
        getWeather()
    }
    
    // weather
    func getWeather() {
        // weather의 각각의 값 선언
        let cloudy = WeatherModel(name: "Cloudy☁️", imageName: "Cloudy", information: cloudInfo, musicName: "Heavy-Rain")
        let drizzle = WeatherModel(name: "Drizzle🌦️", imageName: "Drizzle", information: drizzleInfo, musicName: "Drizzle")
        let fog = WeatherModel(name: "Fog🌫️", imageName: "Fog", information: fogInfo, musicName: "Fog")
        let heavysnow = WeatherModel(name: "Heavy Snow🌨️", imageName: "HeavySnow", information: heavySnowInfo, musicName: "HeavySnow")
        let lightning = WeatherModel(name: "Lightning⚡️", imageName: "Lightning", information: ligttningInfo, musicName: "Lightning")
        let raining = WeatherModel(name: "Raining🌧️", imageName: "Raining", information: rainingInfo, musicName: "Raining")
        let snow = WeatherModel(name: "Snow⛄️", imageName: "Snow", information: snowInfo, musicName: "Snow")
        let suddenshower = WeatherModel(name: "Sudden Shower🌧️🌧️🌧️", imageName: "SuddenShower", information: suddenShowerInfo, musicName: "SuddenShower")
        let sunny = WeatherModel(name: "Sunny☀️", imageName: "Sunny", information: sunnyInfo, musicName: "Sunny")
        let typhoon = WeatherModel(name: "Typoon🌪️", imageName: "Typoon", information: typoonInfo, musicName: "Typhoon")
        
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
        self.weatherArray.append(typhoon)
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
