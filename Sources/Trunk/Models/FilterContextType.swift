//
//  FilterContextType.swift
//  
//
//  Created by Fledge Shiu on 2021/4/30.
//

import Foundation

public enum FilterContextType: String, Codable {
    /// home timeline and lists
    case home
    /// notifications timeline
    case notifications
    /// public timelines
    case `public`
    ///  expanded thread of a detailed status
    case thread
    /// whole account
    case account
}
