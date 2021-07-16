//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a file or media attachment that can be added to a status.
public class Attachment: Codable {
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        type = try values.decode(AttachmentType.self, forKey: .type)
        url = try? values.decode(URL?.self, forKey: .url)
        previewURL = try? values.decode(URL?.self, forKey: .previewURL)
        remoteUrl = try? values.decode(URL?.self, forKey: .remoteUrl)
        previewRemoteURL = try? values.decode(URL?.self, forKey: .previewRemoteURL)
        textURL = try? values.decode(URL?.self, forKey: .textURL)
        switch type {
        case .audio:
            meta = .audio(try values.decode(AttachmentAudioMeta.self, forKey: .meta))
        case .video:
            meta = .video(try values.decode(AttachmentVideoMeta.self, forKey: .meta))
        case .gifv:
            meta = .gifv(try values.decode(AttachmentGIFVMeta.self, forKey: .meta))
        case .image:
            meta = .image(try values.decode(AttachmentImageMeta.self, forKey: .meta))
        default:
            meta = nil
        }
        description = try? values.decode(String?.self, forKey: .description)
        blurhash = try? values.decode(String?.self, forKey: .blurhash)

    }
    // Required attributes
    /// The ID of the attachment in the database.
    public let id: String
    /// The type of the attachment.
    public let type: AttachmentType
    /// The location of the original full-size attachment.
    public let url: URL?
    /// The location of a scaled-down preview of the attachment.
    public let previewURL: URL?
    
    // Optional attributes
    /// The location of the full-size original attachment on the remote website.
    public let remoteUrl: URL?
    /// I don't know what is yet.
    public let previewRemoteURL: URL?
    /// A shorter URL for the attachment.
    public let textURL: URL?
    /// Metadata returned by Paperclip.
    public let meta: AttachmentMetaType?
    /// Alternate text that describes what is in the media attachment, to be used for the visually impaired or when media attachments do not load.
    public let description: String?
    /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
    public let blurhash: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case previewURL = "preview_url"
        case remoteUrl = "remote_url"
        case previewRemoteURL = "preview_remote_url"
        case textURL = "text_url"
        case meta
        case description
        case blurhash
    }
    
    public enum AttachmentType: String, Codable {
        /// unsupported or unrecognized file type
        case unknown
        /// Static image
        case image
        /// Looping, soundless animation
        case gifv
        /// Video clip
        case video
        /// Audio track
        case audio
    }
    
    public enum AttachmentMetaType: Encodable {
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .video(let meta):
                try container.encode(meta)
            case .gifv(let meta):
                try container.encode(meta)
            case .image(let meta):
                try container.encode(meta)
            case .audio(let meta):
                try container.encode(meta)
            }
        }
        
        case audio(AttachmentAudioMeta)
        case gifv(AttachmentGIFVMeta)
        case image(AttachmentImageMeta)
        case video(AttachmentVideoMeta)
    }
}
