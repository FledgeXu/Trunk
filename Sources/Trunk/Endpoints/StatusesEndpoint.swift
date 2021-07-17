//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/17.
//

import Foundation

public enum StatusesEndpoint {
    public static func publishStatusWithPoll(status: String,
                                             mediaIds: [String]? = nil,
                                             pollOptions: [String],
                                             pollExpiresIn: Int,
                                             pollMultiple: Bool? = nil,
                                             pollHideTotals: Bool? = nil,
                                             inReplyToId: String? = nil,
                                             sensitive: Bool? = nil,
                                             spoilerText: String? = nil,
                                             visibility: VisibilityType? = nil,
                                             language: String? = nil) -> Request<Status> {
        publishStatus(status: status, mediaIds: mediaIds, pollOptions: pollOptions, pollExpiresIn: pollExpiresIn, pollMultiple: pollMultiple, pollHideTotals: pollHideTotals, inReplyToId: inReplyToId, sensitive: sensitive, spoilerText: spoilerText, visibility: visibility, language: language)
    }
    
    public static func publishStatusWithMedia(status: String,
                                              mediaIds: [String],
                                              pollOptions: [String]? = nil,
                                              pollExpiresIn: Int? = nil,
                                              pollMultiple: Bool? = nil,
                                              pollHideTotals: Bool? = nil,
                                              inReplyToId: String? = nil,
                                              sensitive: Bool? = nil,
                                              spoilerText: String? = nil,
                                              visibility: VisibilityType? = nil,
                                              language: String? = nil) -> Request<Status> {
        publishStatus(status: status, mediaIds: mediaIds, pollOptions: pollOptions, pollExpiresIn: pollExpiresIn, pollMultiple: pollMultiple, pollHideTotals: pollHideTotals, inReplyToId: inReplyToId, sensitive: sensitive, spoilerText: spoilerText, visibility: visibility, language: language)
    }
    public static func publishStatus(status: String,
                                     mediaIds: [String]? = nil,
                                     pollOptions: [String]? = nil,
                                     pollExpiresIn: Int? = nil,
                                     pollMultiple: Bool? = nil,
                                     pollHideTotals: Bool? = nil,
                                     inReplyToId: String? = nil,
                                     sensitive: Bool? = nil,
                                     spoilerText: String? = nil,
                                     visibility: VisibilityType? = nil,
                                     language: String? = nil) -> Request<Status> {
        var parameters = [
            Parameter(key: "status", value: status),
            Parameter(key: "poll[expires_in]", value: pollExpiresIn.flatMap(toOptionalString)),
            Parameter(key: "poll[multiple]", value: pollMultiple.flatMap(toOptionalString)),
            Parameter(key: "poll[hide_totals]", value: pollHideTotals.flatMap(toOptionalString)),
            Parameter(key: "in_reply_to_id", value: inReplyToId),
            Parameter(key: "sensitive", value: sensitive.flatMap(toOptionalString)),
            Parameter(key: "spoiler_text", value: spoilerText),
            Parameter(key: "visibility", value: visibility?.rawValue),
            Parameter(key: "language", value: language),
        ]
        mediaIds?.forEach({ id in
            parameters.append(Parameter(key: "media_ids[]", value: id))
        })
        pollOptions?.forEach({ option in
            parameters.append(Parameter(key: "poll[options][]", value: option))
        })
        let payload = Payload.PARAMETERS(parameters)
        // Generate parameters hash
        let base64Data = generateParametersHash(data: payload.data ?? Data())
        return Request(path: "/api/v1/statuses", method: .POST(payload), headers: [Header(name: "Idempotency-Key", value: base64Data)])
    }
    
    public static func publishschedulededStatus(status: String,
                                                scheduledAt: Date,
                                                mediaIds: [String]? = nil,
                                                pollOptions: [String]? = nil,
                                                pollExpiresIn: Int? = nil,
                                                pollMultiple: Bool? = nil,
                                                pollHideTotals: Bool? = nil,
                                                inReplyToId: String? = nil,
                                                sensitive: Bool? = nil,
                                                spoilerText: String? = nil,
                                                visibility: VisibilityType? = nil,
                                                language: String? = nil) -> Request<ScheduledStatus> {
        var parameters = [
            Parameter(key: "status", value: status),
            Parameter(key: "scheduled_at", value: scheduledAt.iso8601withFractionalSeconds),
            Parameter(key: "poll[expires_in]", value: pollExpiresIn.flatMap(toOptionalString)),
            Parameter(key: "poll[multiple]", value: pollMultiple.flatMap(toOptionalString)),
            Parameter(key: "poll[hide_totals]", value: pollHideTotals.flatMap(toOptionalString)),
            Parameter(key: "in_reply_to_id", value: inReplyToId),
            Parameter(key: "sensitive", value: sensitive.flatMap(toOptionalString)),
            Parameter(key: "spoiler_text", value: spoilerText),
            Parameter(key: "visibility", value: visibility?.rawValue),
            Parameter(key: "language", value: language),
        ]
        mediaIds?.forEach({ id in
            parameters.append(Parameter(key: "media_ids[]", value: id))
        })
        pollOptions?.forEach({ option in
            parameters.append(Parameter(key: "poll[options][]", value: option))
        })
        let payload = Payload.PARAMETERS(parameters)
        // Generate parameters hash
        let base64Data = generateParametersHash(data: payload.data ?? Data())
        return Request(path: "/api/v1/statuses", method: .POST(payload), headers: [Header(name: "Idempotency-Key", value: base64Data)])
    }
    
    public static func getSpecificStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)", method: .GET(.EMPTY))
    }
    
    public static func deleteStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)", method: .DELETE(.EMPTY))
    }
    
    public static func getParentAndChildStatuses(id: String) -> Request<Context> {
        return Request(path: "/api/v1/statuses/\(id)/context", method: .GET(.EMPTY))
    }
    
    public static func getBoostedByAccounts(withId id: String) -> Request<[Account]> {
        return Request(path: "/api/v1/statuses/\(id)/reblogged_by", method: .GET(.EMPTY))
    }
    
    public static func getFavouritedByAccounts(withId id: String) -> Request<[Account]> {
        return Request(path: "/api/v1/statuses/\(id)/favourited_by", method: .GET(.EMPTY))
    }
    
    public static func favouriteStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/favourite", method: .POST(.EMPTY))
    }
    
    public static func unfavouriteStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unfavourite", method: .POST(.EMPTY))
    }
    
    public static func boostStatus(id: String, visibility: VisibilityType? = nil) -> Request<Status> {
        let parameters = [Parameter(key: "visibility", value: visibility?.rawValue)]
        return Request(path: "/api/v1/statuses/\(id)/reblog", method: .POST(.PARAMETERS(parameters)))
    }
    
    public static func unboostStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unreblog", method: .POST(.EMPTY))
    }
    
    public static func bookmarkStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/bookmark", method: .POST(.EMPTY))
    }
    
    public static func unbookmarkStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unbookmark", method: .POST(.EMPTY))
    }
    
    public static func muteConversation(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unmute", method: .POST(.EMPTY))
    }
    
    public static func unmuteConversation(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unmute", method: .POST(.EMPTY))
    }
    
    public static func pinStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/pin", method: .POST(.EMPTY))
    }
    
    public static func unpinStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unpin", method: .POST(.EMPTY))
    }
}
