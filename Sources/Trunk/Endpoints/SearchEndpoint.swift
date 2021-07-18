//
//  SearchEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum SearchEndpoint {
    
    /// Search results
    /// Endpoint: `/api/v2/search`
    /// - Parameters:
    ///   - q: The search query
    ///   - accountId: If provided, statuses returned will be authored only by this account
    ///   - maxId: Return results older than this id
    ///   - minId: Return results immediately newer than this id
    ///   - type: Enum(accounts, hashtags, statuses)
    ///   - excludeUnreviewed: Filter out unreviewed tags? Defaults to false. Use true when trying to find trending tags.
    ///   - resolve: Attempt WebFinger lookup. Defaults to false.
    ///   - limit: Maximum number of results to load, per type. Defaults to 20. Max 40.
    ///   - offset: Offset in search results. Used for pagination. Defaults to 0.
    ///   - following: Only include accounts that the user is following. Defaults to false.
    /// - Returns: Results
    public static func searchResults(keyword q: String,
                              accountId: String? = nil,
                              maxId: String? = nil,
                              minId: String? = nil,
                              type: SearchType? = nil,
                              excludeUnreviewed: Bool? = nil,
                              resolve: Bool? = nil,
                              limit: Int? = nil,
                              offset: Int? = nil,
                              following: Bool? = nil)-> Request<Results> {
        let toBetween = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "q", value: q),
            Parameter(key: "account_id", value: accountId),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "min_id", value: minId),
            Parameter(key: "type", value: type?.rawValue),
            Parameter(key: "exclude_unreviewed", value: excludeUnreviewed.flatMap(trueOrNil)),
            Parameter(key: "resolve", value: resolve.flatMap(trueOrNil)),
            Parameter(key: "limit", value: limit.map(toBetween).flatMap(toOptionalString)),
            Parameter(key: "offset", value: offset.flatMap(toOptionalString)),
            Parameter(key: "following", value: following.flatMap(trueOrNil)),
        ]
        return Request(path: "/api/v2/search", method: .GET(.PARAMETERS(parameters)))
    }
}
