//
//  EndorsementsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum EndorsementsEndpoint {
    
    /// Accounts that the user is currently featuring on their profile.
    /// Endpoint: `/api/v1/endorsements`
    /// - Parameters:
    ///   - limit: Maximum number of results to return. Defaults to 40.
    ///   - maxId: Internal parameter. Use HTTP Link header from response for pagination
    ///   - sinceId: Internal parameter. Use HTTP Link header from response for pagination.
    /// - Returns: Array of Account
    public static func viewCurrentlyFeaturedProfiles(limit: Int? = nil,
                                             maxId: String? = nil,
                                             sinceId: String? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
        ]
        return Request(path: "/api/v1/endorsements", method: .GET(.PARAMETERS(parameters)))
    }

}
