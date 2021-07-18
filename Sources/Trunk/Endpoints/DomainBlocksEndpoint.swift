//
//  DomainBlocksEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum DomainBlocksEndpoint {
    
    /// View domains the user has blocked.
    /// Endpoint: `/api/v1/domain_blocks`
    /// - Parameters:
    ///   - limit: Maximum number of results to return per page. Defaults to 40. NOTE: Pagination is done with the Link header from the response.
    ///   - maxId: Internal parameter. Use HTTP Link header from response for pagination.
    ///   - sinceId: Internal parameter. Use HTTP Link header from response for pagination.
    /// - Returns: Array of strings
    public static func fetchDomainBlocks(limit: Int? = nil,
                                             maxId: String? = nil,
                                             sinceId: String? = nil) -> Request<[String]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
        ]
        return Request(path: "/api/v1/domain_blocks", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Block a domain to:
    /// hide all public posts from it
    /// hide all notifications from it
    /// remove all followers from it
    /// prevent following new users from it (but does not remove existing follows)
    /// Endpoint: `/api/v1/domain_blocks`
    /// - Parameter domain: Domain to block
    /// - Returns: Empty
    public static func blockDomain(domain: String) -> Request<Empty> {
        let parameters = [Parameter(key: "domain",value: domain)]
        return Request(path: "/api/v1/domain_blocks", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Remove a domain block, if it exists in the user's array of blocked domains.
    /// Endpoint: `/api/v1/domain_blocks`
    /// - Parameter domain: Domain to unblock.
    /// - Returns: Empty
    public static func unblockDomain(domain: String) -> Request<Empty> {
        let parameters = [Parameter(key: "domain",value: domain)]
        return Request(path: "/api/v1/domain_blocks", method: .DELETE(.PARAMETERS(parameters)))
    }
}
