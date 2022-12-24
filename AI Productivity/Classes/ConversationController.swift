//
//  ConversationController.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/13/22.
//

import SwiftUI
import Combine

class ConversationController: ObservableObject {
    
    @Published var sendInputNetworkingState: NetworkingState = .neverCalled
    
    @Published var selectedModel: OpenAIModel = OpenAIModel.defaultModel()
    
    @Published var conversationComponents: [ConversationComponent] = []
    
    @Published var userInput: String = ""
    
    let decoder: JSONDecoder = JSONDecoder()
    
    var completions: Set<AnyCancellable> = []
    
    let networking: OpenAINetworking
    
    init(networkingController: OpenAINetworking) {
        networking = networkingController
    }
    
    @MainActor
    func sendInput() async {
        do {
            sendInputNetworkingState = .networking
            let input = CompletionRequestBody(model: selectedModel.id, prompt: userInput, temperature: 0.5, max_tokens: 1000)
            let responseData = try await networking.post(object: input, toRoute: .completions)
            let response: CompletionRequestResponse = try decoder.decode(CompletionRequestResponse.self, from: responseData)
            let humanComponent = ConversationComponent(generator: .human, text: userInput, meta: nil)
            conversationComponents.append(humanComponent)
            userInput = ""
            let aiComponent = ConversationComponent(generator: .ai, text: response.fullResponse, meta: nil)
            conversationComponents.append(aiComponent)
            sendInputNetworkingState = .finished
        }catch {
            sendInputNetworkingState = .error(error)
        }
    }
    
}



