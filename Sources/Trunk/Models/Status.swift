//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

public class Status: Codable {
    // Base attributes
    /// ID of the status in the database.
    public let id: String
    /// URI of the status used for federation.
    public let uri: String
    /// The date when this status was created.
    public let createdAt: String
    /// he account that authored this status.
    public let account: Account
    /// HTML-encoded status content.
    public let content: String?
    /// Visibility of this status.
    public let visibility: VisibilityType
    /// Is this status marked as sensitive content?
    public let sensitive: Bool
    /// Subject or summary line, below which status content is collapsed until expanded.
    public let spoilerText: String
    /// Media that is attached to this status.
    public let mediaAttachments: [Attachment]
    /// The application used to post this status.
    public let application: Application?
    
    // Rendering attributes
    /// Mentions of users within the status content.
    public let mentions: [Mention]
    /// Hashtags used within the status content.
    public let tags: [Tag]
    /// Custom emoji to be used when rendering status content.
    public let emojis: [Emoji]
    
    // Informational attributes
    /// How many boosts this status has received.
    public let reblogsCount: Int
    /// How many favourites this status has received.
    public let favouritesCount: Int
    /// How many replies this status has received.
    public let repliesCount: Int
    
    // Nullable attributes
    /// A link to the status's HTML representation.
    public let url: URL?
    /// ID of the status being replied.
    public let inReplyToID: String?
    /// ID of the account being replied to.
    public let inReplyToAccountID: String?
    /// The status being reblogged.
    public let reblog: Status?
    /// The poll attached to the status.
    public let poll: Poll?
    /// Preview card for links included within status content.
    public let card: Card?
    /// Primary language of this status.
    public let language: String?
    /// Plain-text source of a status. Returned instead of content when status is deleted, so the user may redraft from the source text without the client having to reverse-engineer the original text from the HTML content.
    public let text: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case uri
        case createdAt = "created_at"
        case account
        case content
        case visibility
        case sensitive
        case spoilerText = "spoiler_text"
        case mediaAttachments = "media_attachments"
        case application
        case mentions
        case tags
        case emojis
        case reblogsCount = "reblogs_count"
        case favouritesCount = "favourites_count"
        case repliesCount = "replies_count"
        case url
        case inReplyToID = "in_reply_to_id"
        case inReplyToAccountID = "in_reply_to_account_id"
        case reblog
        case poll
        case card
        case language
        case text
    }
}
