//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum SuggestionsEndpoint {
    public static func getFollowSuggestions(limit: Int? = nil) -> Request<[Account]> {
        let toBettern = between(1, and: 80, default: 40)
        let parameters = [Parameter(key: "limit", value: limit.map(toBettern).flatMap(toOptionalString))]
        return Request(path: "/api/v1/suggestions", method: .GET(.PARAMETERS(parameters)))
    }
}
