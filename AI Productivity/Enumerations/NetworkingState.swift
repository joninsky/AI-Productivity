//
//  NetworkingState.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/13/22.
//

import Foundation


enum NetworkingState {
    case neverCalled
    case networking
    case finished
    case noResults
    case error(Error)
}
