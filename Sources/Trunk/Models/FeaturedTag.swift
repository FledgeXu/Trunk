//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a hashtag that is featured on a profile.
public class FeaturedTag: Codable {
    // Attributes
    /// The internal ID of the featured tag in the database.
    public let id: String
    /// The name of the hashtag being featured.
    public let name: String
    ///  A link to all statuses by a user that contain this hashtag.
    public let url: URL?
    /// The number of authored statuses containing this hashtag.
    public let statusesCount: Int
    /// The timestamp of the last authored status containing this hashtag.
    public let lastStatusAt: String?
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case statusesCount = "statuses_count"
        case lastStatusAt = "last_status_at"
    }
}
