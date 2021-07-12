//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents an error message.
public class Error: Codable {
    // Required attributes
    /// The error message.
    public let error: String
    
    // Optional attributes
    /// A longer description of the error, mainly provided with the OAuth API.
    public let errorDescription: String?
    
    private enum CodingKeys: String, CodingKey {
        case error
        case errorDescription = "error_description"
    }
}
