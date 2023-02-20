//
//  ConversationView.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/16/22.
//

import Foundation
import SwiftUI

/// Insert some documentation here
struct ConversationView: View {
    //MARK: Environment and State objects
    
    //MARK: State and Binding objects
    @EnvironmentObject var conversationController: ConversationController
    //MARK: Other properties
    
    //MARK: View Body
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 22) {
                        ForEach(conversationController.conversationComponents) { component in
                            ConversationComponentView(component: component)
                        }
                    }
                }.onChange(of: conversationController.conversationComponents) { newValue in
                    guard let lastComponent = conversationController.conversationComponents.last else {
                        return
                    }
                    withAnimation {
                        proxy.scrollTo(lastComponent.id, anchor: .bottom)
                    }
                }
            }
            HStack {
                Button(action: { Task { await conversationController.sendInput() } }) {
                    CustomButton(networkingState: $conversationController.sendInputNetworkingState, imageName: "paperplane.circle", buttonText: "Send", color: Color.green, tintColor: Color.darkModeWhite)
                }.buttonStyle(.plain)
                Spacer()
            }
            CustomTextField(inputText: $conversationController.userInput) {
                Task { await conversationController.sendInput() }
            }
        }
    }
    
    //MARK: Init if needed
    init() {
        
    }
    
    //MARK: Functions
    
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConversationView()
            ConversationView()
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            ConversationView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            ConversationView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            ConversationView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
            ConversationView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
        }
        
    }
}
