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
    
    public static func featureTag(name: String) -> Request<FeaturedTag> {
        let parameters = [Parameter(key: "name", value: name)]
        return Request(path: "/api/v1/featured_tags", method: .POST(.PARAMETERS(parameters)))
    }
    
    public static func unfeatureTag(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/featured_tags/\(id)", method: .DELETE(.EMPTY))
    }
    
    public static func getSuggestedTagsToFeature()-> Request<[Tag]> {
        return Request(path: "/api/v1/featured_tags/suggestions", method: .GET(.EMPTY))
    }
}
