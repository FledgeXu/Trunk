//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation
public enum RepliesPolicyType: String, Codable {
    /// Show replies to any followed user
    case followed
    /// Show replies to members of the list
    case list
    /// Show replies to no one
    case none
}
