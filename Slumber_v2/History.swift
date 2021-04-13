//
//  History.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI

struct History: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    Text("History")
                        .font(.largeTitle).fontWeight(.bold).foregroundColor(.white).padding(.bottom, 4.0)
                    Text("(Coming Soon)")
                        .font(.caption).foregroundColor(.white)
                }
            }
        }
        .tabItem {
            Label("History", systemImage: "calendar.badge.clock")
        }.tag(2)
        .edgesIgnoringSafeArea(.all)
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
