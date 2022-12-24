//
//  OpenAINetworking.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/13/22.
//

import Foundation
import Combine

public class OpenAINetworking: ObservableObject {
    
    var apiKey: String?
    
    let rootURLString = "https://api.openai.com/v1"
    
    let url: URL
    
    let encoder: JSONEncoder = JSONEncoder()
    
    var subscriptions: Set<AnyCancellable> = []
    
    public init(keyPublisher: AnyPublisher<String?, Never>) {
        guard let url = URL(string: rootURLString) else  {
            fatalError("Could not make root URL")
        }
        self.url = url
        keyPublisher.assign(to: \.apiKey, on: self).store(in: &subscriptions)
    }
    
    public func post(object: Codable?, toRoute route: OpenAPIRoutes, usingSession session: URLSession = URLSession.shared) async throws -> Data {
        let finalURL = url.appendingPathComponent(route.rawValue)
        var request: URLRequest = URLRequest(url: finalURL)
        if let object = object {
            request.httpBody = try encoder.encode(object)
        }
        request.httpMethod = "POST"
        guard let apiKey = self.apiKey else {
            throw NetworkingError.noAPIKey
        }
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let responseTuple = try await session.data(for: request)
        guard let responseObject = responseTuple.1 as? HTTPURLResponse else {
            throw NetworkingError.badResponse
        }
        
        switch responseObject.statusCode {
        case 200...299:
            return responseTuple.0
        default:
            throw NetworkingError.badResponse
        }
    }
    
    
    public func get(route: OpenAPIRoutes, usingSession session: URLSession = URLSession.shared) async throws -> Data {
        let finalURL = url.appendingPathComponent(route.rawValue)
        var request: URLRequest = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        guard let apiKey = apiKey else {
            throw NetworkingError.noAPIKey
        }
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let responseTuple = try await session.data(for: request)
        guard let responseObject = responseTuple.1 as? HTTPURLResponse else {
            throw NetworkingError.badResponse
        }
        
        switch responseObject.statusCode {
        case 200...299:
            return responseTuple.0
        default:
            throw NetworkingError.badResponse
        }
    }
    
}
