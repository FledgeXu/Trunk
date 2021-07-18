//
//  NotificationsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum NotificationsEndpoint {
    
    /// Notifications concerning the user. This API returns Link headers containing links to the next/previous page. However, the links can also be constructed dynamically using query params and id values.
    /// Endpoint: `/api/v1/notifications`
    /// - Parameters:
    ///   - accountId: Return only notifications received from this account
    ///   - excludeTypes: Array of types to exclude (follow, favourite, reblog, mention, poll, follow_request)
    ///   - limit: Maximum number of results to return (default 20)
    ///   - maxId: Return results older than this ID
    ///   - sinceId: Return results newer than this ID
    ///   - minId: Return results immediately newer than this ID
    /// - Returns: Array of Notification
    public static func getAllNotifications(accountId: String? = nil,
                                           excludeTypes: [NotificationType]? = nil,
                                           limit: Int? = nil,
                                           maxId: String? = nil,
                                           sinceId: String? = nil,
                                           minId: String? = nil) -> Request<[Notification]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        var parameters = [
            Parameter(key: "account_id", value: accountId),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "min_id", value: minId),
        ]
        excludeTypes?.forEach({ notificationType in
            parameters.append(Parameter(key: "exclude_types[]", value: notificationType.rawValue))
        })
        return Request(path: "/api/v1/notifications", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// View information about a notification with a given ID.
    /// Endpoint: `/api/v1/notifications/:id`
    /// - Parameter id: ID of the notification in the database.
    /// - Returns: Notification
    public static func getSingleNotification(id: String) -> Request<Notification> {
        return Request(path: "/api/v1/notifications/\(id)", method: .GET(.EMPTY))
    }
    
    /// Clear all notifications from the server.
    /// Endpoint: `/api/v1/notifications/clear`
    /// - Returns: Empty
    public static func dismissAllNotifications() -> Request<Empty> {
        return Request(path: "/api/v1/notifications/clear", method: .POST(.EMPTY))
    }
    
    /// Clear a single notification from the server.
    /// Endpoint: `/api/v1/notifications/:id/dismiss`
    /// - Parameter id: ID of the notification to be cleared
    /// - Returns: Empty
    public static func dismissSingleNotification(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/notifications/\(id)/dismiss", method: .POST(.EMPTY))
    }
}
