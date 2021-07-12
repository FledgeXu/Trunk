//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents display or publishing preferences of user's own account. Returned as an additional entity when verifying and updated credentials, as an attribute of Account.
public class Source: Codable {
    // Base attributes
    /// Profile bio.
    public let note: String
    /// Metadata about the account.
    public let fields: [Field]
    
    // Nullable attributes
    /// The default post privacy to be used for new statuses.
    public let privacy: String?
    /// Whether new statuses should be marked sensitive by default.
    public let sensitive: String?
    /// The default posting language for new statuses.
    public let language: String?
    /// The number of pending follow requests.
    public let followRequestsCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case note
        case fields
        case privacy
        case sensitive
        case language
        case followRequestsCount = "follow_requests_count"
    }
}
