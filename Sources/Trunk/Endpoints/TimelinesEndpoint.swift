//
//  TimelinesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation

public enum TimelinesEndpoint {
    
    /// Get public timeline
    /// Endpoint: `/api/v1/timelines/public`
    /// - Parameters:
    ///   - local: Show only local statuses? Defaults to false.
    ///   - remote: Show only remote statuses? Defaults to false.
    ///   - onlyMedia: Show only statuses with media attached? Defaults to false.
    ///   - maxID: Return results older than this id
    ///   - sinceID: Return results newer than this id
    ///   - minID: Return results immediately newer than this id
    ///   - limit: Maximum number of results to return. Defaults to 20.
    /// - Returns: Array of Status
    public static func publicTimeline(local: Bool? = nil,
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
    
    /// View public statuses containing the given hashtag.
    /// Endpoint: `/api/v1/timelines/tag/:hashtag`
    /// - Parameters:
    ///   - hashtag: Content of a #hashtag, not including # symbol.
    ///   - local: If true, return only local statuses. Defaults to false.
    ///   - onlyMedia: If true, return only statuses with media attachments. Defaults to false.
    ///   - maxID: Return results older than this ID.
    ///   - sinceID: Return results newer than this ID.
    ///   - minID: Return results immediately newer than this ID.
    ///   - limit: Maximum number of results to return. Defaults to 20.
    /// - Returns: Array of Status
    public static func hashtagTimeline(hashtag: String,
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
    
    /// View statuses from followed users.
    /// Endpoint: `/api/v1/timelines/home`
    /// - Parameters:
    ///   - local: Return only local statuses?
    ///   - maxID: Return results older than id
    ///   - sinceID: Return results newer than id
    ///   - minID: Return results immediately newer than id
    ///   - limit: Maximum number of results to return. Defaults to 20.
    /// - Returns: Array of Status
    public static func homeTimeline(local: Bool? = nil,
                                    maxID: String? = nil,
                                    sinceID: String? = nil,
                                    minID: String? = nil,
                                    limit: Int? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "local", value: local.flatMap(trueOrNil)),
            Parameter(key: "max_id", value: maxID),
            Parameter(key: "since_id", value: sinceID),
            Parameter(key: "min_id", value: minID),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/timelines/home", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// View statuses in the given list timeline.
    /// Endpoint: `/api/v1/timelines/list/:list_id`
    /// - Parameters:
    ///   - id: Local ID of the list in the database.
    ///   - maxID: Return results older than this ID.
    ///   - sinceID: Return results newer than this ID.
    ///   - minID: Return results immediately newer than this ID.
    ///   - limit: Maximum number of results to return. Defaults to 20.Return results older than this ID.
    /// - Returns: Array of Status
    public static func listTimeline(id: String,
                                    maxID: String? = nil,
                                    sinceID: String? = nil,
                                    minID: String? = nil,
                                    limit: Int? = nil) -> Request<[Status]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "max_id", value: maxID),
            Parameter(key: "since_id", value: sinceID),
            Parameter(key: "min_id", value: minID),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/timelines/list/\(id)", method: .GET(.PARAMETERS(parameters)))
    }
}
