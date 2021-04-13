//
//  Tips.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI

struct Tips: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 122.0)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Suggestions")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Things you can do to improve your routine")
                                .font(.subheadline)
                                .foregroundColor(Color("Accent_Blue_2"))
                                .padding(.top, 8.0)
                        }
                        Spacer()
                    }.padding(.horizontal, 32.0)
                    .padding(.bottom, 36.0)
                    ScrollView{
                        VStack {
                            SuggestionCard()
                                .shadow(color: Color("Background_two"), radius: 6)
                                .padding(.bottom,8)
                            SuggestionCard()
                                .shadow(color: Color("Background_two"), radius: 6)
                                .padding(.bottom,8)
                            SuggestionCard()
                                .shadow(color: Color("Background_two"), radius: 6)
                                .padding(.bottom,8)
                            SuggestionCard()
                                .shadow(color: Color("Background_two"), radius: 6)
                                .padding(.bottom,8)
                            Spacer()
                            .frame(height: 200.0)
                        }
                        .padding(.top, 8.0)
                        .padding(.horizontal, 32.0)
                    }
                    Spacer()
                }
            }
        }
        .tabItem {
            Label("Tips", systemImage: "lightbulb")
        }.tag(3)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        Tips()
    }
}
