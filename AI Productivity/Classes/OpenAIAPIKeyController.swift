//
//  OpenAIAPIKeyController.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/22/22.
//

import Foundation


public class OpenAIAPIKeyController: ObservableObject {
    
    @Published public var userInputAPIKey: String = ""
    
    @Published public var apiKey: String?
    
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        let userDefaultKeys = UserDefaultKeys()
        let keyFromDisk = userDefaults.string(forKey: userDefaultKeys.API_KEY_KEY)
        apiKey = keyFromDisk
    }
    
    
    public func setApiKey(newKey: String) {
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
