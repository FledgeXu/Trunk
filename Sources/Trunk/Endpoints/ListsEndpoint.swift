//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum ListsEndpoint {
    public static func getLists() -> Request<[List]> {
        return Request(path: "/api/v1/lists")
    }
    
    public static func getSingleLists(id: String) -> Request<List> {
        return Request(path: "/api/v1/lists/\(id)")
    }
    
    public static func createList(title: String, repliesPolicy: RepliesPolicyType? = nil) -> Request<List> {
        let parameters = [
            Parameter(key: "title", value: title),
            Parameter(key: "replies_policy", value: repliesPolicy?.rawValue)
        ]
        return Request(path: "/api/v1/lists", method: .POST(.PARAMETERS(parameters)))
    }
}
