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
}
