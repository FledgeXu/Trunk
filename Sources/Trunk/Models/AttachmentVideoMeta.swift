//
//  AttachmentVideoMeta.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a file or media attachment that can be added to a status.
public class AttachmentVideoMeta: Codable {
    public class MetaOriginal: Codable {
        public let width: Int
        public let height: Int
        public let frameRate: String
        public let duration: Double
        public let bitrate: Int
        
        private enum CodingKeys: String, CodingKey {
            case width
            case height
            case frameRate = "frame_rate"
            case duration
            case bitrate
        }
    }
    public class MetaSmall: Codable {
        public let width: Int
        public let height: Int
        public let size: String
        public let aspect: Double
    }
    
    public let length: String?
    public let duration: Double?
    public let fps: Int?
    public let size: String?
    public let width: Int?
    public let height: Int?
    public let aspect: Double?
    public let audioEncode: String?
    public let audioBitrate: String?
    public let audioChannels: String?
    public let original: MetaOriginal?
    public let small: MetaSmall?
    
    private enum CodingKeys: String, CodingKey {
        case length
        case duration
        case fps
        case size
        case width
        case height
        case aspect
        case audioEncode = "audio_encode"
        case audioBitrate = "audio_bitrate"
        case audioChannels = "audio_channels"
        case original
        case small
    }
}
