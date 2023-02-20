//
//  Color_Extension.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/22/22.
//

import SwiftUI


extension Color {
    static var darkModeWhite: Color {
        #if os(macOS)
        return Color(nsColor: NSColor.controlBackgroundColor)
        #else
        return Color(uiColor: UIColor.systemBackground)
        #endif
        
    }
}
