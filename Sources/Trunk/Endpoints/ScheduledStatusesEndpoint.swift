//
//  ScheduledStatusesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/17.
//

import Foundation

public enum ScheduledStatusesEndpoint {
    
    /// View scheduled statuses
    /// Endpoint: `/api/v1/scheduled_statuses`
    /// - Parameters:
    ///   - limit: Max number of results to return. Defaults to 20.
    ///   - maxId: Return results older than ID
    ///   - sinceId: Return results newer than ID
    ///   - minId: Return results immediately newer than ID
    /// - Returns: Array of ScheduledStatus
    public static func viewScheduledStatuses(limit: Int? = nil,
                                        maxId: String? = nil,
                                        sinceId: String? = nil,
                                        minId: String? = nil) -> Request<[ScheduledStatus]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        let parameters = [
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "min_id", value: minId),
        ]
        return Request(path: "/api/v1/scheduled_statuses", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// View a single scheduled status
    /// Endpoint: `/api/v1/scheduled_statuses/:id`
    /// - Parameter id: ID of the scheduled status in the database.
    /// - Returns: ScheduledStatus
    public static func viewSingleScheduledStatus(id: String) -> Request<ScheduledStatus> {
        return Request(path: "/api/v1/scheduled_statuses/\(id)", method: .GET(.EMPTY))
    }
    
    /// Schedule a status
    /// Endpoint: `/api/v1/scheduled_statuses/:id`
    /// - Parameters:
    ///   - id: ID of the Status to be scheduled
    ///   - scheduledAt: ISO 8601 Datetime at which the status will be published. Must be at least 5 minutes into the future.
    /// - Returns: ScheduledStatus
    public static func scheduleStatus(id: String, scheduledAt: Date) -> Request<ScheduledStatus> {
        let parameters = [Parameter(key: "scheduled_at", value: scheduledAt.iso8601withFractionalSeconds)]
        return Request(path: "/api/v1/scheduled_statuses/\(id)", method: .PUT(.PARAMETERS(parameters)))
    }
    
    /// Cancel a scheduled status
    /// Endpoint: `/api/v1/scheduled_statuses/:id`
    /// - Parameter id: ID of the scheduled status in the database.
    /// - Returns: Empty
    public static func cancelScheduledStatus(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/scheduled_statuses/\(id)", method: .DELETE(.EMPTY))
    }
}
