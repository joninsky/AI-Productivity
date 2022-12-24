//
//  AI_ProductivityTests.swift
//  AI ProductivityTests
//
//  Created by Aviation Resources on 12/12/22.
//

import XCTest
import AI_Productivity

final class AI_ProductivityTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testGetModels() async throws {
        let networker = OpenAINetworking()
        let responseData = try await networker.get(route: .models)
        let response = try JSONDecoder().decode(ModelsRequestResponse.self, from: responseData)
        XCTAssertGreaterThan(response.data.count, 0)
    }

    func testConversation() async throws {
        let networker = OpenAINetworking()
        let input = CompletionRequestBody(model: "text-davinci-003", prompt: "Please make a simple SwiftUI form.", temperature: 1.0, max_tokens: 50)
        let responseData = try await networker.post(object: input, toRoute: .completions)
        let response = try JSONDecoder().decode(CompletionRequestResponse.self, from: responseData)
        XCTAssertGreaterThan(response.choices.count, 0)
        let firstChoice = response.choices.first
        XCTAssertNotNil(firstChoice)
        print(firstChoice!.text)
        print(firstChoice!.finish_reason)
        print(response.usage)
    }

}
