//
//  Timelines.swift
//  
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public struct TimelinePublicParameters: Encodable {
    let local: Bool?
    let remote: Bool?
    let onlyMedia: Bool?
    let maxID: String?
    let sinceID: String?
    let minID: String?
    let limit: Int?
    private enum CodingKeys: String, CodingKey {
        case local
        case remote
        case onlyMedia = "only_media"
        case maxID = "max_id"
        case sinceID = "since_id"
        case minID = "min_id"
        case limit
    }
    public init(local: Bool? = nil, remote: Bool? = nil, onlyMedia: Bool? = nil, maxID: String? = nil, sinceID: String? = nil, minID: String? = nil, limit: Int? = nil) {
        self.local = local
        self.remote = remote
        self.onlyMedia = onlyMedia
        self.maxID = maxID
        self.sinceID = sinceID
        self.minID = minID
        self.limit = limit
    }
}

public enum TimelineEndpoint {
    public static func `public`(parameters: TimelinePublicParameters) -> Request<[Status], TimelinePublicParameters> {
        return Request(path: "/api/v1/timelines/public", method: .GET(.PARAMETERS(parameters)))
    }
}
