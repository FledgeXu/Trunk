//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents the tree around a given status. Used for reconstructing threads of statuses.
public class Card: Codable {
    // Base attributes
    /// Location of linked resource.
    public let url: URL
    /// Title of linked resource.
    public let title: String
    /// Description of preview.
    public let description: String
    /// The type of the preview card.
    public let type: CardType
    
    // Optional attributes
    /// The author of the original resource.
    public let authorName: String?
    /// A link to the author of the original resource.
    public let authorURL: String?
    /// The provider of the original resource.
    public let providerName: String?
    /// A link to the provider of the original resource.
    public let providerURL: String?
    /// HTML to be used for generating the preview card.
    public let html: String?
    /// Width of preview, in pixels.
    public let width: Int
    /// Height of preview, in pixels.
    public let height: Int
    /// Preview thumbnail.
    public let image: URL?
    /// Used for photo embeds, instead of custom html.
    public let embedURL: String?
    /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
    public let blurhash: String?
    
    private enum CodingKeys: String, CodingKey {
        case url
        case title
        case description
        case type
        case authorName = "author_name"
        case authorURL = "author_url"
        case providerName = "provider_name"
        case providerURL = "provider_url"
        case html
        case width
        case height
        case image
        case embedURL = "embed_url"
        case blurhash
    }
    
    public enum CardType: String, Codable {
        /// Link OEmbed
        case link
        case photo
        case video
        case rich
    }
}
