//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a weekly bucket of instance activity.
public class Activity: Codable {
    // Attributes
    /// Midnight at the first day of the week.
    public let week: Int64
    /// Statuses created since the week began.
    public let statuses: String
    /// User logins since the week began.
    public let logins: String
    /// User registrations since the week began.
    public let registrations: String
    
    private enum CodingKeys: String, CodingKey {
        case week
        case statuses
        case logins
        case registrations
    }
}
