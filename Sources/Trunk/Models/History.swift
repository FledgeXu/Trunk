//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

///Represents daily usage history of a hashtag.
public class History: Codable {
    // Required attributes
    /// UNIX timestamp on midnight of the given day.
    public let day: Int64
    /// the counted usage of the tag within that day.
    public let uses: String
    /// the total of accounts using the tag within that day.
    public let accounts: String
    
    private enum CodingKeys: String, CodingKey {
        case day
        case uses
        case accounts
    }
}
