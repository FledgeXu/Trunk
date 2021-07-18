//
//  BookmarksEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum BookmarksEndpoint {
    
    /// Statuses the user has bookmarked.
    /// Endpoint: `/api/v1/bookmarks`
    /// - Parameters:
    ///   - limit:
    ///   - maxId:
    ///   - sinceId:
    ///   - minId:
    /// - Returns: Array of Status
    public static func bookmarkedStatuses(limit: Int? = nil,
                                             maxId: String? = nil,
                                             sinceId: String? = nil,
                                             minId: String? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "min_id", value: minId),
        ]
        return Request(path: "/api/v1/bookmarks", method: .GET(.PARAMETERS(parameters)))
    }
}
