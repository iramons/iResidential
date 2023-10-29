//
//  MainTabBar.swift
//  iResidential
//
//  Created by Ramon Santos on 29/10/23.
//

import SwiftUI

enum MainTab: String, CaseIterable {
    case house
    case message
    case person
    case leaf
    case gearshape
}

struct MainTabBar: View {
    
    // MARK: Internal
    
    @Binding var selectedTab: MainTab
    
    var body: some View {
        VStack {
            HStack {
                ForEach(MainTab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    let isSameTab = tab == selectedTab
                    Image(systemName: isSameTab ? fillImage : tab.rawValue)
                        .scaleEffect(isSameTab ? 1.35 : 1.0)
                        .foregroundColor(isSameTab ? tabColor : .gray)
                        .font(.system(size: 17))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.3)) {
                                selectedTab = tab
                            }
                        }
                    
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
    
    // MARK: Private
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house: .orange
        case .message: .blue
        case .person: .red
        case .leaf: .green
        case .gearshape: .teal
        }
    }
}

#Preview {
    MainTabBar(selectedTab: .constant(.house))
}
