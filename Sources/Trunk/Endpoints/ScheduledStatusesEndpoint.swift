//
//  ScheduledStatusesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/17.
//

import Foundation

public enum ScheduledStatusesEndpoint {
    public static func getScheduledStatuses(limit: Int? = nil,
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
    
    public static func getSpecificScheduledStatus(id: String) -> Request<ScheduledStatus> {
        return Request(path: "/api/v1/scheduled_statuses/\(id)", method: .GET(.EMPTY))
    }
    
    public static func updateScheduledStatusTime(id: String, scheduledAt: Date) -> Request<ScheduledStatus> {
        let parameters = [Parameter(key: "scheduled_at", value: scheduledAt.iso8601withFractionalSeconds)]
        return Request(path: "/api/v1/scheduled_statuses/\(id)", method: .PUT(.PARAMETERS(parameters)))
    }
    
    public static func deleteScheduledStatus(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/scheduled_statuses/\(id)", method: .DELETE(.EMPTY))
    }
}
