//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents an emoji reaction to an Announcement.
public class AnnouncementReaction: Codable {
    // Base attributes
    /// The emoji used for the reaction. Either a unicode emoji, or a custom emoji's shortcode.
    public let name: String
    /// The total number of users who have added this reaction.
    public let count: Int
    /// Whether the authorized user has added this reaction to the announcement.
    public let me: Bool
    
    // Custom emoji attributes
    /// A link to the custom emoji.
    public let url: URL?
    /// A link to a non-animated version of the custom emoji.
    public let staticURL: URL?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case count
        case me
        case url
        case staticURL = "static_url"
    }
}
