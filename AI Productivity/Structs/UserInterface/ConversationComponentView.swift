//
//  ConversationComponentView.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/25/22.
//

import Foundation

import SwiftUI

/// Insert some documentation here
struct ConversationComponentView: View {

    
    //MARK: Environment and State objects
    
    //MARK: State and Binding objects
    
    //MARK: Other properties
    let component: ConversationComponent
    
    //MARK: View Body
    var body: some View {
        if #available(iOS 16.0, *) {
            TextEditor(text: .constant(component.text))
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .allowsTightening(false)
                .font(.body)
                .foregroundColor(Color.darkModeWhite)
                .multilineTextAlignment(.leading)
                .lineSpacing(12)
                .padding([.leading, .trailing], 24)
                .padding([.top, .bottom], 12)
                .background(component.backgroundColor)
                .cornerRadius(8)
                .id(component.id)
        } else {
            TextEditor(text: .constant(component.text))
                .allowsTightening(false)
                .font(.body)
                .foregroundColor(Color.darkModeWhite)
                .multilineTextAlignment(.leading)
                .lineSpacing(12)
                .padding([.leading, .trailing], 24)
                .padding([.top, .bottom], 12)
                .background(component.backgroundColor)
                .cornerRadius(8)
                .id(component.id)
        }
    }
    
    //MARK: Init if needed
    internal init(component: ConversationComponent) {
        self.component = component
        
        #if os(iOS)
        UITextView.appearance().backgroundColor = .clear
        UITextView.appearance().isScrollEnabled = false
        #endif
    }
    
    //MARK: Functions
    
}

struct ConversationComponentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConversationComponentView(component: ConversationComponent.mock())
            ConversationComponentView(component: ConversationComponent.mock())
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            ConversationComponentView(component: ConversationComponent.mock())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            ConversationComponentView(component: ConversationComponent.mock())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            ConversationComponentView(component: ConversationComponent.mock())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
            ConversationComponentView(component: ConversationComponent.mock())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
        }
    }
}
