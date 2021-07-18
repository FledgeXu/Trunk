//
//  ConversationsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum ConversationsEndpoint {
    
    /// Show conversation
    /// Endpoint: `/api/v1/conversations`
    /// - Parameters:
    ///   - maxID: Return results older than this ID. Use HTTP Link header to paginate.
    ///   - sinceID: Return results newer than this ID. Use HTTP Link header to paginate.
    ///   - minID: Return results immediately newer than this ID. Use HTTP Link header to paginate.
    ///   - limit: Maximum number of results. Defaults to 20. Max 40.
    /// - Returns: Array of Conversation
    public static func showConversation(maxID: String? = nil,
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
    
    /// Remove conversation
    /// Endpoint: `/api/v1/conversations/:id`
    /// - Parameter id: ID of the conversation in the database
    /// - Returns: Empty
    public static func removeConversation(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/conversations/\(id)", method: .DELETE(.EMPTY))
    }
    
    /// Mark as read
    /// Endpoint: `/api/v1/conversations/:id/read`
    /// - Parameter id: ID of the conversation in the database
    /// - Returns: Conversation
    public static func makeAsRead(id: String) -> Request<Conversation> {
        return Request(path: "/api/v1/conversations/\(id)/read", method: .POST(.EMPTY))
    }
}
