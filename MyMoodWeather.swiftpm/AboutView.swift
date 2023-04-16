//
//  AboutView.swift
//  MyMoodWeather
//
//  Created by Bokyung on 2023/04/16.
//

import SwiftUI

struct AboutView: View {
    // property - binding
    @Environment(\.dismiss) var dismiss
    
    let aboutMyMoodWeather: String = "\"My Mood Weather\" is an app designed to help young children actively understand and express their emotions. Children aged 5-7 commonly express their feelings through nonverbal behaviors such as actions or gestures rather than verbal communication. For example, when feeling angry, they may stomp their feet or swing their arms, and when feeling sad, they may cry. \n\nDue to their limited language ability and emotional recognition skills, children may have difficulty expressing their emotions in words. \"My Mood Weather\" encourages children to understand their mood by associating it with weather, and helps them actively recognize and express their emotions. \n\nThis activity can help children express their emotions proactively even in situations where it may be uncomfortable, and help them naturally accept their emotions. The activity of allowing children to choose the background color of the picture according to their mood also respects their autonomy and helps improve their self-efficacy."
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true){
                VStack {
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .padding()
                        }
                        Spacer()
                    }
                    
                    Text(aboutMyMoodWeather)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(20)
                    
                } // : VStack
            }// :SrollView
        }// : ZStack
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
