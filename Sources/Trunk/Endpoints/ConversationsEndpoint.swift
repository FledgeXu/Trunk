//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum ConversationsEndpoint {
    public static func getConversations(maxID: String? = nil,
                                        sinceID: String? = nil,
                                        minID: String? = nil,
                                        limit: Int? = nil) -> Request<[Conversation]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "max_id", value: maxID),
            Parameter(key: "since_id", value: sinceID),
            Parameter(key: "min_id", value: minID),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/conversations", method: .GET(.PARAMETERS(parameters)))
    }
}
