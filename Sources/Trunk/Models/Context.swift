//
//  Context.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents the tree around a given status. Used for reconstructing threads of statuses.
public class Context: Codable {
    // Required attributes
    /// Parents in the thread.
    public let ancestors: [Status]
    /// Children in the thread.
    public let descendants: [Status]
}
