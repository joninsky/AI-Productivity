//
//  OpenAIModel.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/17/22.
//

import Foundation

public struct OpenAIModel: Codable, Identifiable, Equatable {
    public let id: String
    let object: String
    let created: Int
    let owned_by: String
    let root: String
    
    public init(id: String, object: String, created: Int, owned_by: String, root: String) {
        self.id = id
        self.object = object
        self.created = created
        self.owned_by = owned_by
        self.root = root
    }
    
    
    func humanReadableName() -> String {
        let rawId = self.id
        let hyphenRemoved = rawId.replacingOccurrences(of: "-", with: " ")
        let colenRemoved = hyphenRemoved.replacingOccurrences(of: ":", with: " ")
        return colenRemoved.capitalized
    }
    
    static public func == (lhs: OpenAIModel, rhs: OpenAIModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func defaultModel() -> OpenAIModel {
        let id: String = "text-davinci-003"
        let object: String = "model"
        let created: Int = 99
        let owned_by: String = "default"
        let root: String = "default"
        let model = OpenAIModel(id: id, object: object, created: created, owned_by: owned_by, root: root)
        return model
    }

}
