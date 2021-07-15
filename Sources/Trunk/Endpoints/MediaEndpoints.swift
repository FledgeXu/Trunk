//
//  MediaEndpoints.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public enum MediaEndpoints {
    public static func upload(file: Data,
                              thumbnail: Data? = nil,
                              description: String? = nil,
                              focus: String? = nil) -> Request<Attachment> {
        let parameters = [
            Parameter(key: "description", value: description),
            Parameter(key: "focus", value: focus),
        ]
        let dataParameters = [
            DataParameter(key: "file", value: file),
            DataParameter(key: "thumbnail", value: thumbnail)
        ]
        return Request(path: "/api/v2/media", method: .POST(.MEDIA(parameters, dataParameters)))
    }
}
