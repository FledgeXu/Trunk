//
//  DirectoryEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum DirectoryEndpoint {
    
    /// List accounts visible in the directory.
    /// Endpoint: `/api/v1/directory`
    /// - Parameters:
    ///   - offset: How many accounts to skip before returning results. Default 0.
    ///   - limit: How many accounts to load. Default 40.
    ///   - order: active to sort by most recently posted statuses (default) or new to sort by most recently created profiles.
    ///   - local: Only return local accounts.
    /// - Returns: Array of Account
    public static func viewProfileDirectory(offset: Int? = nil,
                                            limit: Int? = nil,
                                            order: OrderType? = nil,
                                            local: Bool? = nil) -> Request<[Account]> {
        let toBetween = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "offset", value: offset.flatMap(toOptionalString)),
            Parameter(key: "limit", value: limit.map(toBetween).flatMap(toOptionalString)),
            Parameter(key: "order", value: order?.rawValue),
            Parameter(key: "local", value: local.flatMap(trueOrNil)),
        ]
        return Request(path: "/api/v1/directory", method: .GET(.PARAMETERS(parameters)))
    }
}
