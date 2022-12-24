//
//  ModelListController.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/17/22.
//

import Foundation

class ModelListController: ObservableObject {
    
    @Published var networkingState: NetworkingState = .neverCalled
    
    @Published var sourceData: [OpenAIModel] = []
    @Published var filteredData: [OpenAIModel] = []
    
    let networking: OpenAINetworking
    
    init(networkingController: OpenAINetworking) {
        networking = networkingController
        $sourceData.map({$0.sorted(by: {$0.id < $1.id})}).assign(to: &$filteredData)
    }
    
    
    @MainActor
    func queryModelList() async {
        do {
            networkingState = .networking
            let data = try await networking.get(route: .models)
            let response = try JSONDecoder().decode(ModelsRequestResponse.self, from: data)
            switch response.data.isEmpty {
            case true:
                networkingState = .noResults
            case false:
                networkingState = .finished
            }
            sourceData = response.data
        }catch {
            networkingState = .error(error)
        }
    }
    
}
