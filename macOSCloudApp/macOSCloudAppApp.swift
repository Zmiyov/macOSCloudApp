//
//  macOSCloudAppApp.swift
//  macOSCloudApp
//
//  Created by Vladimir Pisarenko on 03.06.2024.
//

import SwiftUI

@main
struct macOSCloudAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
