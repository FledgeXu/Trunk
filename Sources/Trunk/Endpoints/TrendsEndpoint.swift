//
//  TrendsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum TrendsEndpoint {
    
    /// Tags that are being used more frequently within the past week.
    /// Endpoint: `/api/v1/trends`
    /// - Parameter limit: Maximum number of results to return. Defaults to 10.
    /// - Returns: Array of Tag with History
    public static func trendingTags(limit: Int? = nil) -> Request<[Tag]> {
        let toBetween = between(1, and: 20, default: 10)
        let parameters = [Parameter(key: "limit", value: limit.map(toBetween).flatMap(toOptionalString))]
        return Request(path: "/api/v1/trends", method: .GET(.PARAMETERS(parameters)))
    }
}
