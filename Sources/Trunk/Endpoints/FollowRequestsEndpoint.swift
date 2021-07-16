//
//  FollowRequestsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FollowRequestsEndpoint {
    public static func getPendingFollows(limit: Int? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))]
        return Request(path: "/api/v1/follow_requests", method: .GET(.PARAMETERS(parameters)))
    }
    
    public static func acceptFollow(id: Int) -> Request<Relationship> {
        return Request(path: "/api/v1/follow_requests/\(id)/authorize", method: .POST(.EMPTY))
    }
}
