//
//  AppTabBarView.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/9/23.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .iconXYZ, selection: $tabSelection)
            Color.green
                .tabBarItem(tab: .cart, selection: $tabSelection)
            Color.orange
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            Color.black
                .tabBarItem(tab: .menu, selection: $tabSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}
