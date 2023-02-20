//
//  RootView.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/13/22.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var keyController: OpenAIAPIKeyController
    @EnvironmentObject var conversationController: ConversationController
    @EnvironmentObject var modelList: ModelListController

    @State var showSettings: Bool = false
    
    var body: some View {
        VStack {
            header.padding()
            LineView(weight: .THICK, gapPosition: .NONE, color: Color.primary)
            ConversationView().padding()
        }.sheet(isPresented: $showSettings) {
            SettingsView(showSettings: $showSettings)
                .frame(idealWidth: 500, idealHeight: 500)
                .environmentObject(keyController)
                .environmentObject(conversationController)
                .environmentObject(modelList)
        }
    }
    
    var header: some View {
        HStack {
            Text(conversationController.selectedModel.humanReadableName()).font(.headline.bold())
            Spacer()
            Button(action: { showSettings.toggle() }) {
                CustomButton(imageName: "gear.circle", buttonText: "Settings", color: Color.blue, tintColor: Color.darkModeWhite)
            }.buttonStyle(.plain)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
            RootView()
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            RootView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            RootView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            RootView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
            RootView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
        }
    }
}



