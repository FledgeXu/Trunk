//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a mention of a user within the content of a status.
public class Mention: Codable {
    public let mentions: [MentionType]
    public class MentionType: Codable{
        /// The account id of the mentioned user.
        public let id: String
        /// The username of the mentioned user.
        public let username: String
        /// The webfinger acct: URI of the mentioned user. Equivalent to username for local users, or username@domain for remote users.
        public let acct: String
        /// The location of the mentioned user's profile.
        public let url: URL
        private enum CodingKeys: String, CodingKey {
            case id
            case username
            case acct
            case url
        }
    }
    private enum CodingKeys: String, CodingKey {
        case mentions
    }
}
