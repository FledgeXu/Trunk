//
//  FiltersEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FiltersEndpoint {
    public static func getFilters() -> Request<[Filter]> {
        return Request(path: "/api/v1/filters", method: .GET(.EMPTY))
    }
    
    public static func getFilter(withId id: Int) -> Request<Filter> {
        return Request(path: "/api/v1/filters/\(id)", method: .GET(.EMPTY))
    }
    
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
}
