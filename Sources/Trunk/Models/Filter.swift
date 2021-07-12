//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a user-defined filter for determining which statuses should not be shown to the user.
public class Filter: Codable {
    // Attributes
    /// The ID of the filter in the database.
    public let id: String
    /// The text to be filtered.
    public let phrase: String
    /// The contexts in which the filter should be applied.
    public let context: [FilterContextType]
    /// When the filter should no longer be applied
    public let expiresAt: Date?
    /// Should matching entities in home and notifications be dropped by the server?
    public let irreversible: Bool
    /// Should the filter consider word boundaries?
    /// If whole_word is true , client app should do:
    /// Define ‘word constituent character’ for your app. In the official implementation, it’s [A-Za-z0-9_] in JavaScript, and [[:word:]] in Ruby. Ruby uses the POSIX character class (Letter | Mark | Decimal_Number | Connector_Punctuation).
    /// If the phrase starts with a word character, and if the previous character before matched range is a word character, its matched range should be treated to not match.
    /// If the phrase ends with a word character, and if the next character after matched range is a word character, its matched range should be treated to not match.
    /// Please check app/javascript/mastodon/selectors/index.js and app/lib/feed_manager.rb in the Mastodon source code for more details.
    let wholeWord: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case phrase
        case context
        case expiresAt = "expires_at"
        case irreversible
        case wholeWord = "whole_word"
    }
}
