//
//  FavouritesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FavouritesEndpoint {
    
    /// Statuses the user has favourited.
    /// Endpoint: `/api/v1/favourites`
    /// - Parameters:
    ///   - limit:
    ///   - maxId: Internal parameter. Use HTTP Link header for pagination instead.
    ///   - minId: Internal parameter. Use HTTP Link header for pagination instead.
    /// - Returns: Array of Status
    public static func favouritedStatuses(limit: Int? = nil,
                                          maxId: String? = nil,
                                          minId: String? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "min_id", value: minId),
        ]
        return Request(path: "/api/v1/favourites", method: .GET(.PARAMETERS(parameters)))
    }
}
