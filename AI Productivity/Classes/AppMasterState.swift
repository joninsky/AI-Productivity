//
//  AppMasterState.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/22/22.
//

import Foundation

public class AppMasterState: ObservableObject {
    
    let keyController: OpenAIAPIKeyController = OpenAIAPIKeyController()
    let conversationController: ConversationController
    let modelListController: ModelListController
    
    
    @Published var hasAPIKey: Bool = false
    
    public init() {
        let networkingController: OpenAINetworking = OpenAINetworking(keyPublisher: keyController.$apiKey.eraseToAnyPublisher())
        conversationController = ConversationController(networkingController: networkingController)
        modelListController = ModelListController(networkingController: networkingController)
        keyController.$apiKey.map({$0 != nil }).assign(to: &$hasAPIKey)
    }
    
}
