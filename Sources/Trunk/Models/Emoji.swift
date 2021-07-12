//
//  Emojis.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a custom emoji.
public class Emoji: Codable {
    // Required attributes
    /// The name of the custom emoji.
    public let shortcode: String
    /// A link to the custom emoji.
    public let url: URL
    /// A link to a static copy of the custom emoji.
    public let staticURL: URL
    /// Whether this Emoji should be visible in the picker or unlisted.
    public let visibleInPicker: Bool
    
    // Optional attributes
    /// Used for sorting custom emoji in the picker.
    public let category: String?
    private enum CodingKeys: String, CodingKey {
        case shortcode
        case url
        case staticURL = "static_url"
        case visibleInPicker = "visible_in_picker"
        case category
    }
}
