//
//  MutesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation
public enum MutesEndpoint {
    
    /// Accounts the user has muted.
    /// Endpoint: `/api/v1/mutes`
    /// - Parameters:
    ///   - limit: Maximum number of results to return per page. Defaults to 40.
    ///   - maxId: Internal parameter. Use the HTTP Link header for pagination instead.
    ///   - sinceId: Internal parameter. Use the HTTP Link header for pagination instead.
    /// - Returns: Array of Account
    public static func mutedAccounts(limit: Int? = nil,
                                             maxId: String? = nil,
                                             sinceId: String? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
        ]
        return Request(path: "/api/v1/mutes", method: .GET(.PARAMETERS(parameters)))
    }
}
