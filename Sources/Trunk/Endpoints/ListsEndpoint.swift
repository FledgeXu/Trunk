//
//  ListsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum ListsEndpoint {
    
    /// Fetch all lists that the user owns.
    /// Endpoint: `/api/v1/lists`
    /// - Returns: Array of List
    public static func showUserLists() -> Request<[List]> {
        return Request(path: "/api/v1/lists")
    }
    
    
    /// Fetch the list with the given ID. Used for verifying the title of a list, and which replies to show within that list.
    /// Endpoint: `/api/v1/lists/:id`
    /// - Parameter id: ID of the list in the database
    /// - Returns: List
    public static func showSingleLists(id: String) -> Request<List> {
        return Request(path: "/api/v1/lists/\(id)")
    }
    
    /// Create a new list.
    /// Endpoint: `/api/v1/lists`
    /// - Parameters:
    ///   - title: The title of the list to be created.
    ///   - repliesPolicy: Enumerable oneOf followed list none. Defaults to list.
    /// - Returns: List
    public static func createList(title: String, repliesPolicy: RepliesPolicyType? = nil) -> Request<List> {
        let parameters = [
            Parameter(key: "title", value: title),
            Parameter(key: "replies_policy", value: repliesPolicy?.rawValue)
        ]
        return Request(path: "/api/v1/lists", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Change the title of a list, or which replies to show.
    /// Endpoint: `/api/v1/lists/:id`
    /// - Parameters:
    ///   - id: ID of the list in the database
    ///   - title: The title of the list to be updated.
    ///   - repliesPolicy: Enumerable oneOf followed list none.
    /// - Returns: List
    public static func updateList(id: String,
                                  title: String,
                                  repliesPolicy: RepliesPolicyType? = nil) -> Request<List> {
        let parameters = [
            Parameter(key: "title", value: title),
            Parameter(key: "replies_policy", value: repliesPolicy?.rawValue)
        ]
        return Request(path: "/api/v1/lists/\(id)", method: .PUT(.PARAMETERS(parameters)))
    }
    
    /// Delete a list
    /// Endpoint: `/api/v1/lists/:id`
    /// - Parameter id: ID of the list in the database
    /// - Returns: Empty
    public static func deleteList(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/lists/\(id)", method: .DELETE(.EMPTY))
    }
    
    /// View accounts in list
    /// Endpoint: `/api/v1/lists/:id/accounts`
    /// - Parameter id: ID of the list in the database
    /// - Returns: Array of Account
    public static func viewAccountsInList(id: String,
                                          limit: Int? = nil,
                                          maxId: String? = nil,
                                          sinceId: String? = nil) -> Request<[Account]> {
        let toBetween = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "limit", value: limit.map(toBetween).flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/lists/\(id)/accounts", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Add accounts to the given list. Note that the user must be following these accounts.
    /// Endpoint: `/api/v1/lists/:id/accounts`
    /// - Parameters:
    ///   - id: ID of the list in the database
    ///   - accountIds: Array of account IDs to add to the list.
    /// - Returns: Empty
    public static func addAccountsToList(id: String, accountIds: [String]) -> Request<Empty> {
        let parameters = accountIds.map { id in
            Parameter(key: "account_ids[]", value: id)
        }
        return Request(path: "/api/v1/lists/\(id)/accounts", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Remove accounts from the given list.
    /// Endpoint: `/api/v1/lists/:id/accounts`
    /// - Parameters:
    ///   - id: ID of the list in the database
    ///   - accountIds: Array of account IDs to remove from the list.
    /// - Returns: Empty
    public static func removeAccountsFromList(id: String, accountIds: [String]) -> Request<Empty> {
        let parameters = accountIds.map { id in
            Parameter(key: "account_ids[]", value: id)
        }
        return Request(path: "/api/v1/lists/\(id)/accounts", method: .DELETE(.PARAMETERS(parameters)))
    }
}
