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
        VStack(spacing: 12) {
            Text("Open AI API Key").font(.title.bold())
            linkStack
            TextField("", text: $keyController.userInputAPIKey).textFieldStyle(.roundedBorder).textFieldStyle(.plain)
            saveButton.alert("Invalid API Key", isPresented: $keyController.isAPKeyValid) {
                
            }
        }.padding()
    }
    
    var linkStack: some View {
        VStack(spacing: 6) {
            Link(destination: URL(string: "https://openai.com")!) {
                Text("Open AI Home page").font(.body.italic()).underline()
            }
            Link(destination: URL(string: "https://platform.openai.com/docs/introduction")!) {
                Text("Open AI API Documentation").font(.body.italic()).underline()
            }
            Link(destination: URL(string: "https://auth0.openai.com/u/login/identifier?state=hKFo2SBKX0o1Uml3dzV4blF1RmZWVnVoMU85eVBhTXJsOEtDQqFur3VuaXZlcnNhbC1sb2dpbqN0aWTZIC04Q0tad2VkMmNWZWZmSV9qVmthWV93b1h1TXo2VjB5o2NpZNkgRFJpdnNubTJNdTQyVDNLT3BxZHR3QjNOWXZpSFl6d0Q")!) {
                Text("Open AI Login Page").font(.body.italic()).underline()
            }
        }
    }
    
    var saveButton: some View {
        Button(action: { saveAPIKey() }) {
            Text("Save").padding().foregroundColor(Color.darkModeWhite).background(Color.primary).cornerRadius(8).overlay {
                RoundedRectangle(cornerRadius: 8).stroke(.white, lineWidth: 2)
            }
        }.buttonStyle(.plain)
    }
    
    //MARK: Init if needed
    
    
    //MARK: Functions
    
    func saveAPIKey() {
        do  {
            keyController.apiKeyError = nil
            try keyController.setApiKey(newKey: keyController.userInputAPIKey)
        }catch {
            keyController.apiKeyError = error
        }
    }
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
