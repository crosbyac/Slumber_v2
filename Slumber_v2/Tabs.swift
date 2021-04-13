//
//  Tabs.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI


struct Tabs: View {
    
    func setupTabBar() {
      UITabBar.appearance().barTintColor = UIColor(named: "Background")
      UITabBar.appearance().clipsToBounds = true
      UITabBar.appearance().tintColor = .clear
      UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    init() {
      setupTabBar()
    }
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Home()
            History()
            Tips()
            Account()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
