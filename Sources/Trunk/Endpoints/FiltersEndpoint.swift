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
}
