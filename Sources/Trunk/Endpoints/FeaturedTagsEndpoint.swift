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
}
