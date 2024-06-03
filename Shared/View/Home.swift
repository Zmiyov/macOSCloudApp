//
//  Home.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 03.06.2024.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = "Home"
    
    var body: some View {
        HStack {
            
            //Side menu
            SideMenu(currentTab: $currentTab)
            
            //Main content
            MainContent()
        }
        .frame(width: getRect().width / 1.3, height: getRect().height - 100, alignment: .leading)
        .background(Color.white.ignoresSafeArea())
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    Home()
}

//Extension for getting screen size
//for both macOS and iOS
extension View {
    func getRect() -> CGRect {
        
        #if os(macOS)
        return NSScreen.main!.visibleFrame
        #else
        return UIScreen.main.bounds
        #endif
    }
}
