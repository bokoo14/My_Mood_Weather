//
//  ContextView.swift
//  ContentView
//
//  Created by Bokyung on 2023/04/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var backgroundColor: Color = .white
    @State var showSheet: Bool = false
    
    let describe: String = "Children aged 5-7 often have difficulty expressing their emotions in concrete terms. Rather than verbally expressing their feelings, young children tend to express themselves through nonverbal means such as actions or gestures.\n\n They may struggle to identify their emotions as they may not fully understand them. Additionally, their language abilities may be limited, making it challenging for them to express their feelings appropriately.\n My Mood Weather uses weather to represent emotions, helping children to understand their emotions visually and auditorily, and encouraging them to express their emotions actively and to accept them naturally."
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor.ignoresSafeArea()
                Image("SketchBook")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("Sunny")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack{
                    HStack {
                        Spacer()
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "plus.magnifyingglass")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }// Button
                        .sheet(isPresented: $showSheet) {
                            AboutView()
                        }
                        .padding(.horizontal, 50)
                        .padding(.top, 20)
                    }
                    
                    
                    Text("My Mood Weather🌦️")
                        .frame(width: 750, height: 120, alignment: .center)
                        .font(.system(size: 70))
                        .foregroundColor(.black)
                        .background(Color.customGray.opacity(0.75))
                        .cornerRadius(20)
                    
                    
                    
                    
                    Spacer()
                    Text(describe)
                        .frame(width: 1000, height: 380, alignment: .center)
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.customGray.opacity(0.75))
                        .cornerRadius(20)
                    
                    HStack{
                        Spacer()
                        NavigationLink {
                            ChooseView()
                        } label: {
                            Text("Express My Mood →")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .background(.yellow)
                                .cornerRadius(10)
                                .padding(.horizontal, 90)
                                .padding(.vertical, 30)
                        }
                    }
                    Spacer()
                }
            }
        }// :NavigationView
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
