//
//  CustomText.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/17.
//

import SwiftUI

struct CustomText: View {
    var value = ""
    var fontSize = 32
    var color = Color.black
    
    var body: some View {
        Text(value)
            .font(Font.custom("KCC-Chassam", size: CGFloat(fontSize)))
            .lineSpacing(8)
            .foregroundColor(color)
    }
}
