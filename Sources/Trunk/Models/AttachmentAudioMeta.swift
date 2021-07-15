//
//  AttachmentAudioMeta.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a file or media attachment that can be added to a status.
public class AttachmentAudioMeta: Codable {
    public class MetaOriginal: Codable {
        public let duration: Double
        public let bitrate: Int
    }
    
    public let length: String?
    public let duration: Double?
    public let audioEncode: String?
    public let audioBitrate: String?
    public let audioChannels: String?
    public let original: MetaOriginal?
    
    private enum CodingKeys: String, CodingKey {
        case length
        case duration
        case audioEncode = "audio_encode"
        case audioBitrate = "audio_bitrate"
        case audioChannels = "audio_channels"
        case original
    }
}
