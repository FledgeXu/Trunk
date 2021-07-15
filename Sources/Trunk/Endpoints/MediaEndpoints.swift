//
//  MediaEndpoints.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public struct MediaUploadParameters: Encodable {
    let file: Data
    let thumbnail: Data?
    let description: String?
    let focus: String?
    public init(file: Data,thumbnail: Data? = nil, description: String? = nil, focus: String? = nil) {
        self.file = file
        self.thumbnail = thumbnail
        self.description = description
        self.focus = focus
    }
}

public enum MediaEndpoints {
    public static func upload(file: Data,thumbnail: Data? = nil, description: String? = nil, focus: String? = nil) -> Request<Attachment> {
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
