//
//  FollowRequestsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FollowRequestsEndpoint {
    
    /// Get pending follows
    /// Endpoint: `/api/v1/follow_requests`
    /// - Parameter limit: Maximum number of results to return. Defaults to 40. Paginate using the HTTP Link header.
    /// - Returns: Array of Account
    public static func pendingFollows(limit: Int? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))]
        return Request(path: "/api/v1/follow_requests", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Accept follow
    /// - Parameter id: ID of the account in the database
    /// - Returns: Relationship
    public static func acceptFollow(id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/follow_requests/\(id)/authorize", method: .POST(.EMPTY))
    }
    
    /// Reject follow
    /// - Parameter id: ID of the account in the database
    /// - Returns: Relationship
    public static func rejectFollow(id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/follow_requests/\(id)/reject", method: .POST(.EMPTY))
    }
}
