//
//  TabbarBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 27/05/25.
//

import SwiftUI

struct TabbarBootcamp: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    TabbarBootcamp()
}
