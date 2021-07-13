//
//  Tag.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

public class Tag: Codable {
    /// The hashtag, not including the preceding #.
    public let name: String
    /// The URL of the hashtag.
    public let url: String
    /// Tag with history
    public let history: [History]?
}
