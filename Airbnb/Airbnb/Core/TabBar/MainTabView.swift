//
//  MainTabView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 15.12.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            WhishListView()
                .tabItem {
                    Label("Whishlist", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profilw", systemImage: "person")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
