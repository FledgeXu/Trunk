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
    
    public static func updateList(id: String,
                                  title: String,
                                  repliesPolicy: RepliesPolicyType? = nil) -> Request<List> {
        let parameters = [
            Parameter(key: "title", value: title),
            Parameter(key: "replies_policy", value: repliesPolicy?.rawValue)
        ]
        return Request(path: "/api/v1/lists/\(id)", method: .PUT(.PARAMETERS(parameters)))
    }
    
    public static func deleteList(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/lists/\(id)", method: .DELETE(.EMPTY))
    }
    
    public static func getAccountsInList(id: String) -> Request<[Account]> {
        return Request(path: "/api/v1/lists/\(id)/accounts", method: .GET(.EMPTY))
    }
    
    public static func addAccountsToList(id: String, accountIds: [String]) -> Request<Empty> {
        let parameters = accountIds.map { id in
            Parameter(key: "account_ids[]", value: id)
        }
        return Request(path: "/api/v1/lists/\(id)/accounts", method: .POST(.PARAMETERS(parameters)))
    }
}
