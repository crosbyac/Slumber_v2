//
//  ContentView.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI
import CoreData

extension ContentView {
  func setupTabBar() {
    UITabBar.appearance().barTintColor = UIColor(named: "Background")
    UITabBar.appearance().clipsToBounds = true
    UITabBar.appearance().tintColor = .clear
    UITabBar.appearance().unselectedItemTintColor = UIColor.white
  }
}


class UserSettings: ObservableObject {
    @Published var userflow:Int = 0
}

struct ContentView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @EnvironmentObject var settings: UserSettings

    var body: some View{
        NavigationView {
            ZStack{
                if settings.userflow == 0{
                    Login().edgesIgnoringSafeArea(.all)
                }
                if settings.userflow == 1{
                    Onboarding().edgesIgnoringSafeArea(.all)

                }
                if settings.userflow == 2{
                    Tabs().edgesIgnoringSafeArea(.all)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

// Live preview Code Below//

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView().environmentObject(UserSettings())
    }
}
