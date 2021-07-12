//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a poll attached to a status.
public class Poll: Codable {
    // Attributes
    /// The ID of the poll in the database.
    public let id: String
    /// When the poll ends.
    public let expiresAt: Date?
    /// Is the poll currently expired?
    public let expired: Bool
    /// Does the poll allow multiple-choice answers?
    public let multiple: Bool
    /// How many unique accounts have voted on a multiple-choice poll.
    public let votersCount: Int?
    /// When called with a user token, has the authorized user voted?
    public let voted: Bool?
    /// When called with a user token, which options has the authorized user chosen? Contains an array of index values for options.
    public let ownVotes: [Int]?
    /// Possible answers for the poll.
    public let options: [OptionsType]
    /// Custom emoji to be used for rendering poll options.
    public let emojis: [Emoji]
    
    public class OptionsType: Codable {
        /// The text value of the poll option. String.
        public let title: String?
        /// The number of received votes for this option. Number, or null if results are not published yet.
        public let votesCount: Int?
        private enum CodingKeys: String, CodingKey {
            case title
            case votesCount = "votes_count"
        }
    }
    private enum CodingKeys: String, CodingKey {
        case id
        case expiresAt = "expires_at"
        case expired
        case multiple
        case votersCount = "voters_count"
        case voted
        case ownVotes = "own_votes"
        case options
        case emojis
    }
}
