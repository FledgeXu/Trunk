//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum MarkerEndpoint {
    public static func getSavedTimelinePosition(timeline: [MarkerType]) -> Request<Marker> {
        let parameters = timeline.map { type in
            Parameter(key: "timeline[]", value: type.rawValue)
        }
        return Request(path: "/api/v1/markers", method: .GET(.PARAMETERS(parameters)))
    }
    
    public static func savePositionInTimeline(homeLastReadId: String? = nil,
                                              notificationsLastReadId: String? = nil) -> Request<Marker> {
        let parameters = [
            Parameter(key: "home[last_read_id]", value: homeLastReadId),
            Parameter(key: "notifications[last_read_id]", value: notificationsLastReadId)
        ]
        return Request(path: "/api/v1/markers", method: .POST(.PARAMETERS(parameters)))
    }
}
