//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FeaturedTagsEndpoint {
    public static func getFeaturedTags() -> Request<[FeaturedTag]> {
        return Request(path: "/api/v1/featured_tags", method: .GET(.EMPTY))
    }
    
    public static func addFeaturedTags(name: String) -> Request<FeaturedTag> {
        let parameters = [Parameter(key: "name", value: name),]
        return Request(path: "/api/v1/featured_tags", method: .POST(.PARAMETERS(parameters)))
    }
}
