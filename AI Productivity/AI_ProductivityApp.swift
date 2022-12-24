//
//  AI_ProductivityApp.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/12/22.
//

import SwiftUI

@main
struct AI_ProductivityApp: App {
    
    
    @StateObject var stateController: AppMasterState = AppMasterState()
    
    var body: some Scene {
        WindowGroup {
            switch stateController.hasAPIKey {
            case true:
                RootView().environmentObject(stateController.conversationController)
                    .environmentObject(stateController.modelListController)
                    .environmentObject(stateController.keyController)
            case false:
                OpenAIAPIKeyInput().environmentObject(stateController.conversationController)
                    .environmentObject(stateController.modelListController)
                    .environmentObject(stateController.keyController)
            }
        }
    }
}
