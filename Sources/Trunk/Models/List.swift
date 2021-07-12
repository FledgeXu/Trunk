//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a list of some users that the authenticated user follows.
public class List: Codable {
    /// The internal database ID of the list.
    public let id: String
    /// The user-defined title of the list.
    public let title: String
    /// The user-defined title of the list.
    public let repliesPolicy: repliesPolicyType?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case repliesPolicy = "replies_policy"
    }
    
    public enum repliesPolicyType: String, Codable {
        /// Show replies to any followed user
        case followed
        /// Show replies to members of the list
        case list
        /// Show replies to no one
        case none
    }
}
