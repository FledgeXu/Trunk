//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents the results of a search.
public class Results: Codable {
    /// Accounts which match the given query
    public let accounts: [Account]
    /// Statuses which match the given query
    public let statuses: [Status]
    // Hashtags which match the given query
    public let hashtags: [Tag]
}
