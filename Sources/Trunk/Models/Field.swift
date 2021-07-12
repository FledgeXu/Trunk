//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a profile field as a name-value pair with optional verification.
public class Field: Codable {
    // Required attributes
    /// The key of a given field's key-value pair.
    public let name: String
    /// The value associated with the name key.
    public let value: String
    /// Timestamp of when the server verified a URL value for a rel="me” link.
    public let verifiedAt: Date?
    
    public init(name: String, value: String, verifiedAt: Date? = nil) {
        self.name = name
        self.value = value
        self.verifiedAt = verifiedAt
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case value
        case verifiedAt = "verified_at"
    }
}
