//
//  OpenAIAPIKeyController_Tests.swift
//  AI ProductivityTests
//
//  Created by Aviation Resources on 12/22/22.
//

import XCTest
import AI_Productivity

final class OpenAIAPIKeyController_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        let keys = UserDefaultKeys()
        UserDefaults.standard.removeObject(forKey: keys.API_KEY_KEY)
    }
    
    
    func testInit() {
        let controller = OpenAIAPIKeyController()
        XCTAssertNil(controller.apiKey)
        let keys = UserDefaultKeys()
        XCTAssertNil(UserDefaults.standard.object(forKey: keys.API_KEY_KEY))
    }
    
    func testSetKey() {
        let newKey = "some-api-key"
        let controller = OpenAIAPIKeyController()
        controller.setApiKey(newKey: newKey)
        XCTAssertNotNil(controller.apiKey)
        let keys = UserDefaultKeys()
        XCTAssertNotNil(UserDefaults.standard.object(forKey: keys.API_KEY_KEY))
    }
    
    func testSetAndRemoveKey() {
        let newKey = "some-api-key"
        let controller = OpenAIAPIKeyController()
        controller.setApiKey(newKey: newKey)
        XCTAssertNotNil(controller.apiKey)
        let keys = UserDefaultKeys()
        XCTAssertNotNil(UserDefaults.standard.object(forKey: keys.API_KEY_KEY))
        controller.deleteAPIKey()
        let secondController = OpenAIAPIKeyController()
        XCTAssertNil(secondController.apiKey)
        XCTAssertNil(UserDefaults.standard.object(forKey: keys.API_KEY_KEY))
    }
    
}

