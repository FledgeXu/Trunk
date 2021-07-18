//
//  CustomEmojis.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum CustomEmojis {
    
    /// Returns custom emojis that are available on the server.
    /// Endpoint: `/api/v1/custom_emojis`
    /// - Returns: Array of Emoji
    public static func customEmojis() -> Request<[Emoji]> {
        return Request(path: "/api/v1/custom_emojis")
    }
}
