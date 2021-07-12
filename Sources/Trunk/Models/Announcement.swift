//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents an announcement set by an administrator.
public class Announcement: Codable {
    // Base attributes
    /// The announcement id.
    public let id: String
    /// The content of the announcement.
    public let content: String
//    /// Whether the announcement is currently active.
//    public let published: Bool
    /// Whether the announcement has a start/end time.
    public let allDay: Bool
//    /// When the announcement was created.
//    public let createdAt: Date
    /// When the announcement was last updated.
    public let updatedAt: String
    /// Whether the announcement has been read by the user.
    public let read: Bool
    /// Emoji reactions attached to the announcement.
    public let reactions: [AnnouncementReaction]
    
    // Optional attributes
    /// When the future announcement was scheduled.
    public let scheduledAt: Date?
    /// When the future announcement will start.
    public let startsAt: Date?
    /// When the future announcement will end.
    public let endsAt: Date?
    private enum CodingKeys: String, CodingKey {
        case id
        case content
//        case published
        case allDay = "all_day"
//        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case read
        case reactions
        case scheduledAt = "scheduled_at"
        case startsAt = "starts_at"
        case endsAt = "ends_at"
    }
}
