//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a status that will be published at a future scheduled date.
public class ScheduledStatus: Codable {
    public let id: String
    public let scheduledAt: String
    public let params: Params
    public let mediaAttachments: [Attachment]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case scheduledAt = "scheduled_at"
        case params
        case mediaAttachments = "media_attachments"
    }
    
    public class Params: Codable {
        public let text: String
        public let mediaIds: [String]?
        public let sensitive: Bool?
        public let spoilerText: String?
        public let visibility: VisibilityType?
        public let scheduledAt: String?
        public let poll: StatusPollParameters?
        public let idempotency: String?
        public let withRateLimit: Bool?
        public let inReplyToId: String?
        public let applicationId: Int?
        
        private enum CodingKeys: String, CodingKey {
            case text
            case mediaIds = "media_ids"
            case sensitive
            case spoilerText = "spoiler_text"
            case visibility
            case scheduledAt = "scheduled_at"
            case poll
            case idempotency
            case withRateLimit = "with_rate_limit"
            case inReplyToId = "in_reply_to_id"
            case applicationId = "application_id"
        }
        
        public class StatusPollParameters: Codable {
            public let multiple: String?
            public let hideTotals: String?
            public let expiresIn: String
            public let options: [String]
            private enum CodingKeys: String, CodingKey {
                case multiple
                case hideTotals = "hide_totals"
                case expiresIn = "expires_in"
                case options
            }
        }
    }
}
