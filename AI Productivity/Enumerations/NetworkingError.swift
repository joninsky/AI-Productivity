//
//  NetworkingError.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/22/22.
//

import Foundation

enum NetworkingError: Error, CustomStringConvertible {
    case noAPIKey
    case badResponse
    
    var description: String {
        switch self {
        case .noAPIKey:
            return "No API Key"
        case .badResponse:
            return "Bad response"
        }
    }
}
