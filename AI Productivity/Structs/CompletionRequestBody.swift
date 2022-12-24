//
//  CompletionRequestBody.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/13/22.
//

import Foundation


public struct CompletionRequestBody: Codable {

    let model: String
    let prompt: String
    let temperature: Double
    let max_tokens: Int
    
    public init(model: String, prompt: String, temperature: Double, max_tokens: Int) {
        self.model = model
        self.prompt = prompt
        self.temperature = temperature
        self.max_tokens = max_tokens
    }
}
