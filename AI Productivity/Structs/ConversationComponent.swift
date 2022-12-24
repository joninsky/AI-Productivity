//
//  ConversationComponent.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/24/22.
//

import Foundation
import SwiftUI

struct ConversationComponent: Identifiable, Hashable {
    let id: UUID = UUID()
    let generator: Generator
    let text: String
    let meta: String?
    
    var backgroundColor: Color {
        switch generator {
        case .human:
            return Color.green
        case .ai:
            return Color.blue
        }
    }
    
    enum Generator {
        case human
        case ai
    }
    
}
