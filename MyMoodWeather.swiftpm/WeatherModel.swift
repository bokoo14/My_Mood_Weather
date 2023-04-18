//
//  WeatherModel.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/15.
//

import Foundation

struct WeatherModel: Identifiable {
    let id: String = UUID().uuidString // 사용자의 고유의 UUID값을 생성하고, string으로 변환
    let name: String // 화면에 표시할 날씨 정보
    let imageName: String // 이미지의 이름
    let information: String // 날씨에 대한 정보
    let musicName: String // 음악 이름
}
