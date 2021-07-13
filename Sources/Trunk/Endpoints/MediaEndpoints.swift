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
    public static func upload(parameters: MediaUploadParameters) -> Request<Attachment, MediaUploadParameters> {
        let parts = ["file": parameters.file,
                      "thumbnail": parameters.thumbnail,
                      "description": parameters.description?.data(using: .utf8),
                      "focus": parameters.focus?.data(using: .utf8)].compactMapValues { $0 }
        return Request(path: "/api/v2/media", method: .POST(.media(parts)))
    }
}
