//
//  FeaturedTagsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FeaturedTagsEndpoint {
    
    /// View your featured tags
    /// Endpoint: `/api/v1/featured_tags`
    /// - Returns: Array of FeaturedTag
    public static func viewFeaturedTags() -> Request<[FeaturedTag]> {
        return Request(path: "/api/v1/featured_tags", method: .GET(.EMPTY))
    }
    
    /// Feature a tag
    /// Endpoint: `/api/v1/featured_tags`
    /// - Parameter name: The hashtag to be featured.
    /// - Returns: FeaturedTag
    public static func featureTag(name: String) -> Request<FeaturedTag> {
        let parameters = [Parameter(key: "name", value: name)]
        return Request(path: "/api/v1/featured_tags", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Unfeature a tag
    /// Endpoint: `/api/v1/featured_tags/:id`
    /// - Parameter id: The id of the FeaturedTag to be unfeatured.
    /// - Returns: Empty
    public static func unfeatureTag(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/featured_tags/\(id)", method: .DELETE(.EMPTY))
    }
    
    /// Shows your 10 most-used tags, with usage history for the past week.
    /// Endpoint: `/api/v1/featured_tags/suggestions`
    /// - Returns: Array of Tag with History
    public static func suggestedTagsToFeature()-> Request<[Tag]> {
        return Request(path: "/api/v1/featured_tags/suggestions", method: .GET(.EMPTY))
    }
}
