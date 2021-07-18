//
//  MediaEndpoints.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation

public enum MediaEndpoints {
    
    /// Creates an attachment to be used with a new status.
    /// Endpoint: `/api/v1/media`
    /// - Parameters:
    ///   - file: The file to be attached, using multipart form data.
    ///   - thumbnail: The custom thumbnail of the media to be attached, using multipart form data.
    ///   - description: A plain-text description of the media, for accessibility purposes.
    ///   - focus: Two floating points (x,y), comma-delimited, ranging from -1.0 to 1.0
    /// - Returns: Attachment
    public static func uploadMediaAsAttachment(file: Data,
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
    
    /// Get an Attachment, before it is attached to a status and posted, but after it is accepted for processing.
    /// Endpoint: `/api/v1/media`
    /// - Parameter id: The id of the Attachment entity to be updated
    /// - Returns: Attachment
    public static func getAttachment(id: String) -> Request<Attachment> {
        return Request(path: "/api/v1/media/\(id)", method: .GET(.EMPTY))
    }
    
    /// Update an Attachment, before it is attached to a status and posted.
    /// Endpoint: `/api/v1/media/:id`
    /// - Parameters:
    ///   - id: The id of the Attachment entity to be updated
    ///   - file: The file to be attached, using multipart form data.
    ///   - thumbnail: The custom thumbnail of the media to be attached, using multipart form data.
    ///   - description: A plain-text description of the media, for accessibility purposes.
    ///   - focus: Two floating points (x,y), comma-delimited ranging from -1.0 to 1.0
    /// - Returns: Attachment
    public static func updateAttachment(id: String,
                                        file: Data,
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
        return Request(path: "/api/v1/media/\(id)", method: .PUT(.MEDIA(parameters, dataParameters)))
    }
}
