//
//  AnnouncementsEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum AnnouncementsEndpoint {
    
    /// See all currently active announcements set by admins.
    /// Endpoint: `/api/v1/announcements`
    /// - Parameter withDismissed: If true, response will include announcements dismissed by the user. Defaults to false.
    /// - Returns: Array of Announcement
    public static func viewAllAnnouncements(withDismissed: Bool? = nil) -> Request<[Announcement]> {
        let parameters = [Parameter(key: "with_dismissed", value: withDismissed.flatMap(toOptionalString))]
        return Request(path: "/api/v1/announcements", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Allows a user to mark the announcement as read.
    /// Endpoint: `/api/v1/announcements/:id/dismiss`
    /// - Parameter id: Local ID of an announcement in the database.
    /// - Returns: Empty
    public static func dismissAnnouncements(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/announcements/\(id)/dismiss", method: .POST(.EMPTY))
    }
    
    /// React to an announcement with an emoji.
    /// Endpoint: `/api/v1/announcements/:id/reactions/:name`
    /// - Parameters:
    ///   - id: Local ID of an announcement in the database.
    ///   - name: Unicode emoji, or shortcode of custom emoji
    /// - Returns: Empty
    public static func addReaction(id: String, name: String) -> Request<Empty> {
        return Request(path: "/api/v1/announcements/\(id)/reactions/\(name)", method: .PUT(.EMPTY))
    }
    
    /// Undo a react emoji to an announcement.
    /// Endpoint: `/api/v1/announcements/:id/reactions/:name`
    /// - Parameters:
    ///   - id: Local ID of an announcement in the database.
    ///   - name: Unicode emoji, or shortcode of custom emoji
    /// - Returns: Empty
    public static func removeReaction(id: String, name: String) -> Request<Empty> {
        return Request(path: "/api/v1/announcements/\(id)/reactions/\(name)", method: .DELETE(.EMPTY))
    }
}
