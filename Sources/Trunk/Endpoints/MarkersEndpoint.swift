//
//  MarkersEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum MarkersEndpoint {
    
    /// Get saved timeline position
    /// Endpoint: `/api/v1/markers`
    /// - Parameter timeline: Array of markers to fetch. String enum anyOf home, notifications. If not provided, an empty object will be returned.
    /// - Returns: Marker
    public static func getSavedTimelinePosition(timeline: [MarkerType]) -> Request<Marker> {
        let parameters = timeline.map { type in
            Parameter(key: "timeline[]", value: type.rawValue)
        }
        return Request(path: "/api/v1/markers", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Save position in timeline
    /// Endpoint: `/api/v1/markers`
    /// - Parameters:
    ///   - homeLastReadId: ID of the last status read in the home timeline.
    ///   - notificationsLastReadId: ID of the last notification read.
    /// - Returns: Marker
    public static func savePositionInTimeline(homeLastReadId: String? = nil,
                                              notificationsLastReadId: String? = nil) -> Request<Marker> {
        let parameters = [
            Parameter(key: "home[last_read_id]", value: homeLastReadId),
            Parameter(key: "notifications[last_read_id]", value: notificationsLastReadId)
        ]
        return Request(path: "/api/v1/markers", method: .POST(.PARAMETERS(parameters)))
    }
}
