//
//  OpenAIAPIKeyInput.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/22/22.
//

import Foundation
import SwiftUI

/// Insert some documentation here
struct OpenAIAPIKeyInput: View {
    //MARK: Environment and State objects
    @EnvironmentObject var keyController: OpenAIAPIKeyController
    //MARK: State and Binding objects
    
    //MARK: Other properties
    
    //MARK: View Body
    var body: some View {
        VStack {
            Text("Open AI API Key")
            TextField("", text: $keyController.userInputAPIKey).textFieldStyle(.roundedBorder)
            Button(action: { keyController.setApiKey(newKey: keyController.userInputAPIKey) }) {
                Text("Save").padding().foregroundColor(Color.darkModeWhite).background(Color.primary)
            }
        }.padding()
    }
    
    //MARK: Init if needed
    
    
    //MARK: Functions
    
}

struct OpenAIAPIKeyInput_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OpenAIAPIKeyInput()
            OpenAIAPIKeyInput()
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            OpenAIAPIKeyInput()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            OpenAIAPIKeyInput()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            OpenAIAPIKeyInput()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
            OpenAIAPIKeyInput()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
        }.environmentObject(OpenAIAPIKeyController())
    }
}
