//
//  BlocksEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation
public enum BlocksEndpoint {
    
    /// View blocked users
    /// - Parameters:
    ///   - limit: Maximum number of results. Defaults to 40.
    ///   - maxId: Internal parameter. Use HTTP Link header for pagination instead.
    ///   - sinceId: Internal parameter. Use HTTP Link header for pagination instead.
    /// - Returns: Array of Account
    public static func blockedUsers(limit: Int? = nil,
                                             maxId: String? = nil,
                                             sinceId: String? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
        ]
        return Request(path: "/api/v1/blocks", method: .GET(.PARAMETERS(parameters)))
    }
}
