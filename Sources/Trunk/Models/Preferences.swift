//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a user's preferences.
public class Preferences: Codable {
    /// Default visibility for new posts. Equivalent to Source#privacy.
    public let postingDefaultVisibility: VisibilityType
    /// Default sensitivity flag for new posts. Equivalent to Source#sensitive.
    public let postingDefaultSensitive: Bool
    /// Default language for new posts. Equivalent to Source#language
    public let postingDefaultLanguage: String?
    /// Whether media attachments should be automatically displayed or blurred/hidden.
    public let readingExpandMedia: MediaType
    /// Whether CWs should be expanded by default.
    public let readingExpandSpoilers: Bool
    
    public enum MediaType: String, Codable {
        /// Hide media marked as sensitive
        case `default`
        /// Always show all media by default, regardless of sensitivity
        case show_all
        /// Always hide all media by default, regardless of sensitivity
        case hide_all
    }
    
    public enum VisibilityType: String, Codable {
        /// Public post
        case `public`
        /// Unlisted post
        case unlisted
        /// Followers-only post
        case `private`
        /// Direct post
        case direct
    }
    
    private enum CodingKeys: String, CodingKey {
        case postingDefaultVisibility = "posting:default:visibility"
        case postingDefaultSensitive = "posting:default:sensitive"
        case postingDefaultLanguage = "posting:default:language"
        case readingExpandMedia = "reading:expand:media"
        case readingExpandSpoilers = "reading:expand:spoilers"
    }
}
