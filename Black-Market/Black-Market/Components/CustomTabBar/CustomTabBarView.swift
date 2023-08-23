//
//  CustomTabBarView.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/9/23.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBarView
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .iconXYZ, .cart, .favorites, .menu
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(tab.iconName)
        }
        .foregroundColor(localSelection == tab ? Color.black : Color.white)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 34)
                        .fill(Color.gray)
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                        .frame(width: 44, height: 44)
                }
            }
        
        )
    }
    
    private var tabBarView: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.black).ignoresSafeArea(edges: .bottom)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}
