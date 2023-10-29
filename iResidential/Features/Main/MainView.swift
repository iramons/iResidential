//
//  MainView.swift
//  iResidential
//
//  Created by Ramon Santos on 29/10/23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: Lifecycle
        
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: Internal
    
    @State private var selectedTab: MainTab = .house

    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(MainTab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.uppercased())")
                                .bold()
                                .animation(nil, value: selectedTab)
                        }
                        .tag(tab)
                    }
                }
            }
            
            VStack {
                Spacer()
                MainTabBar(selectedTab: $selectedTab)
            }
        }

    }
}

#Preview {
    MainView()
}
