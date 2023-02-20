//
//  OpenAIAPIKeyController.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/22/22.
//

import Foundation


public class OpenAIAPIKeyController: ObservableObject {
    
    @Published public var userInputAPIKey: String = ""
    
    @Published public var apiKeyError: Error?
    @Published public var isAPKeyValid: Bool = true
    
    @Published public var apiKey: String?
    
    
    //API Key Example
    //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
    
    //let apiKeyRegex = Regex
    
    enum APIKeyError: Error {
        case invalidAPIKey
    }
    
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        let userDefaultKeys = UserDefaultKeys()
        let keyFromDisk = userDefaults.string(forKey: userDefaultKeys.API_KEY_KEY)
        apiKey = keyFromDisk
        $apiKeyError.map({$0 != nil}).assign(to: &$isAPKeyValid)
    }
    
    
    public func setApiKey(newKey: String) throws {
        guard newKey.isEmpty == false && newKey.contains("-") else {
            throw APIKeyError.invalidAPIKey
        }
        let userDefaultKeys = UserDefaultKeys()
        userDefaults.set(newKey, forKey: userDefaultKeys.API_KEY_KEY)
        apiKey = newKey
    }
    
    public func deleteAPIKey() {
        let userDefaultKeys = UserDefaultKeys()
        userDefaults.removeObject(forKey: userDefaultKeys.API_KEY_KEY)
        apiKey = nil
        userInputAPIKey = ""
    }
}
