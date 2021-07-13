//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents the last read position within a user's timelines.
public class Marker: Codable {
    /// Information about the user's position in the home timeline.
    public let home: NestedAttributesType?
    /// Information about the user's position in their notifications.
    public let notifications: NestedAttributesType?
    
    public class NestedAttributesType: Codable {
        /// The ID of the most recently viewed entity.
        public let lastReadId: String
        /// The timestamp of when the marker was set.
        public let updatedAt: String
        /// Used for locking to prevent write conflicts.
        public let version: Int
        private enum CodingKeys: String, CodingKey {
            case lastReadId = "last_read_id"
            case updatedAt = "updated_at"
            case version
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case home
        case notifications
    }
}
