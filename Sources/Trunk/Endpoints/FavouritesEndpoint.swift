//
//  FavouritesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum FavouritesEndpoint {
    public static func getFavouritedStatuses(limit: Int? = nil,
                                             maxId: String? = nil,
                                             minId: String? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "min_id", value: minId),
        ]
        return Request(path: "/api/v1/favourites", method: .GET(.PARAMETERS(parameters)))
    }
}
