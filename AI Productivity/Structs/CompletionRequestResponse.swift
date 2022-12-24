//
//  CompletionRequestResponse.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/13/22.
//

import Foundation

public struct CompletionRequestResponse: Codable, Identifiable {
    public let id: String
    public let object: String
    public let created: Int
    public let model: String
    public let choices: [CompletionChoice]
    public let usage: Usage
    
    var fullResponse: String {
        var string: String = ""
        for choice in choices {
            string += choice.text
        }
        return string
    }
    
    public struct CompletionChoice: Codable {
        public let text: String
        public let index: Int
        public let finish_reason: String
        
    }

    public struct Usage: Codable {
        let prompt_tokens: Int
        let completion_tokens: Int
        let total_tokens: Int
    }
    
}


