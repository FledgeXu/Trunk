//
//  Timelines.swift
//  
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation

public enum TimelinesEndpoint {
    public static func `public`(local: Bool? = nil,
                                remote: Bool? = nil,
                                onlyMedia: Bool? = nil,
                                maxID: String? = nil,
                                sinceID: String? = nil,
                                minID: String? = nil,
                                limit: Int? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "local", value: local.flatMap(trueOrNil)),
            Parameter(key: "remote", value: remote.flatMap(trueOrNil)),
            Parameter(key: "only_media", value: onlyMedia.flatMap(trueOrNil)),
            Parameter(key: "max_id", value: maxID),
            Parameter(key: "since_id", value: sinceID),
            Parameter(key: "min_id", value: minID),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/timelines/public", method: .GET(.PARAMETERS(parameters)))
    }
    
    public static func getHashtagTimeline(hashtag: String,
                                local: Bool? = nil,
                                onlyMedia: Bool? = nil,
                                maxID: String? = nil,
                                sinceID: String? = nil,
                                minID: String? = nil,
                                limit: Int? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "local", value: local.flatMap(trueOrNil)),
            Parameter(key: "only_media", value: onlyMedia.flatMap(trueOrNil)),
            Parameter(key: "max_id", value: maxID),
            Parameter(key: "since_id", value: sinceID),
            Parameter(key: "min_id", value: minID),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/timelines/tag/\(hashtag)", method: .GET(.PARAMETERS(parameters)))
    }
}
