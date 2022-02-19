//
//  HomeView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 19/02/22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @State var selectedTab: Int = 2
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "TabBarColor")
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Perfil")
                .font(.system(size: 30 , weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)

            Text("Juegos")
                .font(.system(size: 30 , weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            Text("Home")
                .font(.system(size: 30 , weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)

            Text("Favoritos")
                .font(.system(size: 30 , weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
