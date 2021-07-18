//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum CustomEmojis {
    public static func getCustomEmojis() -> Request<[Emoji]> {
        return Request(path: "/api/v1/custom_emojis")
    }
}
