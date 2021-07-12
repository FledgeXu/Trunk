//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

// Represents a user of Mastodon and their associated profile.
public class Account: Codable {
    //Base Attributes
    /// The account idheader.
    public let id: String
    /// The username of the account, not including domain.
    public let username: String
    /// The Webfinger account URI. Equal to username for local users, or username@domain for remote users.
    public let acct: String
    /// The location of the user's profile page.
    public let url: URL
    
    // Display attributes
    /// The profile's display name.
    public let displayName: String
    /// The profile's bio / description.
    public let note: String
    /// An image icon that is shown next to statuses and in the profile.
    public let avatar: URL
    /// A static version of the avatar. Equal to avatar if its value is a static image; different if avatar is an animated GIF.
    public let avatarStatic: URL
    /// An image banner that is shown above the profile and in profile cards.
    public let header: URL
    /// A static version of the header. Equal to header if its value is a static image; different if header is an animated GIF.
    public let headerStatic: URL
    /// Whether the account manually approves follow requests.
    public let locked: Bool
    /// Custom emoji entities to be used when rendering the profile. If none, an empty array will be returned.
    public let emojis: [Emoji]
    /// Whether the account has opted into discovery features such as the profile directory.
    public let discoverable: Bool
    
    //Statistical attributes
    /// When the account was created.
    public let createdAt: Date
    /// How many statuses are attached to this account.
    public let statusesCount: Int
    /// The reported followers of this profile.
    public let followersCount: Int
    /// The reported follows of this profile.
    public let followingCount: Int
    
    // Optional attributes
    
    /// Indicates that the profile is currently inactive and that its user has moved to a new account.
    public let moved: Account?
    /// Additional metadata attached to a profile as name-value pairs.
    public let fields: [Field]?
    /// A presentational flag. Indicates that the account may perform automated actions, may not be monitored, or identifies as a robot.
    public let bot: Bool?
    /// An extra entity to be used with API methods to verify credentials and update credentials.
    public let source: Source?
    /// An extra entity returned when an account is suspended.
    public let suspended: Bool?
    /// When a timed mute will expire, if applicable.
    public let muteExpiresAt: Date?
    /// When the most recent status was posted.
    /// In Some case this will be null
    public let lastStatusAt: Date?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case acct
        case displayName = "display_name"
        case locked
        case bot
        case createdAt = "created_at"
        case note
        case url
        case avatar
        case avatarStatic = "avatar_static"
        case header
        case headerStatic = "header_static"
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case statusesCount = "statuses_count"
        case lastStatusAt = "last_status_at"
        case emojis
        case discoverable
        case moved
        case fields
        case source
        case suspended
        case muteExpiresAt = "mute_expires_at"
    }
}
