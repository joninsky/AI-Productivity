//
//  SettingsView.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/16/22.
//

import Foundation
import SwiftUI

/// Insert some documentation here
struct SettingsView: View {
    //MARK: Environment and State objects
    @EnvironmentObject var keyController: OpenAIAPIKeyController
    @EnvironmentObject var conversationController: ConversationController
    //MARK: State and Binding objects
    @Binding var showSettings: Bool
    //MARK: Other properties
    
    //MARK: View Body
    var body: some View {
        VStack {
            header
            LineView()
            apiKey
            LineView()
            Spacer()
            ModelListView { model in
                conversationController.selectedModel = model
                showSettings.toggle()
            }
            Spacer()

        }.padding()
    }
    
    var header: some View {
        HStack {
            Spacer()
            Text("All Models").font(.title.bold())
            Spacer()
            Button(action: { showSettings.toggle() }) {
                Image(systemName: "xmark").font(.title).foregroundColor(Color.primary)
            }.buttonStyle(.plain)
        }
    }
    
    var apiKey: some View {
        HStack {
            Text(keyController.apiKey ?? "No API Key").font(.footnote).multilineTextAlignment(.leading).lineLimit(1).truncationMode(.tail)
            Spacer()
            Button(action: { keyController.deleteAPIKey() }) {
                Image(systemName: "trash").font(.body).foregroundColor(Color.red)
            }.buttonStyle(.plain)
        }
    }
    
    //MARK: Init if needed
    
    
    //MARK: Functions
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView(showSettings: .constant(true))
            SettingsView(showSettings: .constant(true))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            SettingsView(showSettings: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            SettingsView(showSettings: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            SettingsView(showSettings: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
            SettingsView(showSettings: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
        }
    }
}
