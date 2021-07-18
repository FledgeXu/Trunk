//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a notification of an event relevant to the user.
public class Notification: Codable {
    // Required attributes
    /// The id of the notification in the database.
    public let id: String
    /// The type of event that resulted in the notification.
    public let type: NotificationType
    /// The timestamp of the notification.
    public let createdAt: String
    /// The account that performed the action that generated the notification.
    public let account: Account
    
    // Optional attributes
    /// Status that was the object of the notification, e.g. in mentions, reblogs, favourites, or polls.
    public let status: Status?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case createdAt = "created_at"
        case account
        case status
    }
}
