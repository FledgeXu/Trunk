//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum TrendsEndpoint {
    public static func getTrendingTags(limit: Int? = nil) -> Request<[Tag]> {
        let toBetween = between(1, and: 20, default: 10)
        let parameters = [Parameter(key: "limit", value: limit.map(toBetween).flatMap(toOptionalString))]
        return Request(path: "/api/v1/trends", method: .GET(.PARAMETERS(parameters)))
    }
}
