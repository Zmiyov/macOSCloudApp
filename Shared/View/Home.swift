//
//  Home.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 03.06.2024.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = "Home"
    @State var showMenu = false
    
    var body: some View {
        HStack {
            
            AdaptableStack(showMenu: $showMenu) {
                MainContent(showMenu: $showMenu)
            } menuView: {
                SideMenu(currentTab: $currentTab)
            } sideView: {
                SideView() 
            }

        }

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
    
    func isMacOS() -> Bool {
        #if os(iOS)
        return false
        #else
        return true
        #endif
    }
}
