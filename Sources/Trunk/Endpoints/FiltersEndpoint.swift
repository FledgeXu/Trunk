//
//  FiltersEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FiltersEndpoint {
    
    /// View all filters
    /// Endpoint: `/api/v1/filters`
    /// - Returns: Filter
    public static func viewAllFilters() -> Request<[Filter]> {
        return Request(path: "/api/v1/filters", method: .GET(.EMPTY))
    }
    
    
    /// View a single filter
    /// Endpoint: `/api/v1/filters/:id`
    /// - Parameter id: Filter id
    /// - Returns: Filter
    public static func viewSingleFilter(id: String) -> Request<Filter> {
        return Request(path: "/api/v1/filters/\(id)", method: .GET(.EMPTY))
    }
    
    
    /// Create a Filter
    /// Endpoint: `/api/v1/filters`
    /// - Parameters:
    ///   - phrase: Text to be filtered
    ///   - context: Array of enumerable strings `home`, `notifications`, `public`, `thread`. At least one context must be specified.
    ///   - irreversible: Should the server irreversibly drop matching entities from home and notifications?
    ///   - wholeWord: Consider word boundaries?
    ///   - expiresIn: Number of seconds from now the filter should expire. Otherwise, null for a filter that doesn't expire.
    /// - Returns: Filter
    public static func createFilter(phrase: String,
                                    context: [FilterContextType],
                                    irreversible: Bool? = nil,
                                    wholeWord: Bool? = nil,
                                    expiresIn: Int? = nil) -> Request<Filter> {
        var parameters = [
            Parameter(key: "phrase", value: phrase),
            Parameter(key: "irreversible", value: irreversible.flatMap(trueOrNil)),
            Parameter(key: "whole_word", value: wholeWord.flatMap(trueOrNil)),
            Parameter(key: "expires_in", value: expiresIn.flatMap(toOptionalString)),
        ]
        context.forEach({ type in
            parameters.append(Parameter(key: "context[]", value: type.rawValue))
        })
        return Request(path: "/api/v1/filters", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Update a Filter
    /// Endpoint: `/api/v1/filters/:id`
    /// - Parameters:
    ///   - id: ID of the filter in the database
    ///   - phrase: Text to be filtered
    ///   - context: Array of enumerable strings `home`, `notifications`, `public`, `thread`. At least one context must be specified.
    ///   - irreversible: Should the server irreversibly drop matching entities from home and notifications?
    ///   - wholeWord: Consider word boundaries?
    ///   - expiresIn: Number of seconds from now the filter should expire. Otherwise, null for a filter that doesn't expire.
    /// - Returns: Filter
    public static func updateFilter(id: String,
                                    phrase: String,
                                    context: [FilterContextType],
                                    irreversible: Bool? = nil,
                                    wholeWord: Bool? = nil,
                                    expiresIn: Int? = nil) -> Request<Filter> {
        var parameters = [
            Parameter(key: "phrase", value: phrase),
            Parameter(key: "irreversible", value: irreversible.flatMap(trueOrNil)),
            Parameter(key: "whole_word", value: wholeWord.flatMap(trueOrNil)),
            Parameter(key: "expires_in", value: expiresIn.flatMap(toOptionalString)),
        ]
        context.forEach({ type in
            parameters.append(Parameter(key: "context[]", value: type.rawValue))
        })
        return Request(path: "/api/v1/filters/\(id)", method: .PUT(.PARAMETERS(parameters)))
    }
    
    /// Remove a filter
    /// Endpoint: `/api/v1/filters/:id`
    /// - Parameter id: ID of the filter in the database
    /// - Returns: Filter
    public static func removeFilter(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/filters/\(id)", method: .DELETE(.EMPTY))
    }
}
