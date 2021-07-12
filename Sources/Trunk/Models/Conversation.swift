//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a conversation with "direct message" visibility.
public class Conversation: Codable {
    // Required attributes
    /// Local database ID of the conversation.
    public let id: String
    /// Participants in the conversation.
    public let accounts: [Account]
    /// Is the conversation currently marked as unread?
    public let unread: Bool
    
    // Optional attributes
    /// The last status in the conversation, to be used for optional display.
    public let lastStatus: Status?
    private enum CordingKeys: String, CodingKey {
        case id
        case accounts
        case unread
        case lastStatus = "last_status"
    }
}
