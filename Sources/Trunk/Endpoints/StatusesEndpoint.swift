//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/17.
//

import Foundation

public enum StatusesEndpoint {
    /// Post a new status.
    /// - Parameters:
    ///   - status: Text content of the status. If media_ids is provided, this becomes optional. Attaching a poll is optional while status is provided.
    ///   - mediaIds: Array of Attachment ids to be attached as media. If provided, status becomes optional, and poll cannot be used.
    ///   - pollOptions: Array of possible answers. If provided, media_ids cannot be used, and poll[expires_in] must be provided.
    ///   - pollExpiresIn: Duration the poll should be open, in seconds. If provided, media_ids cannot be used, and poll[options] must be provided.
    ///   - pollMultiple: Allow multiple choices?
    ///   - pollHideTotals: Hide vote counts until the poll ends?
    ///   - inReplyToId: ID of the status being replied to, if status is a reply
    ///   - sensitive: Mark status and attached media as sensitive?
    ///   - spoilerText: Text to be shown as a warning or subject before the actual content. Statuses are generally collapsed behind this field.
    ///   - visibility: Visibility of the posted status. Enumerable oneOf public, unlisted, private, direct.
    ///   - language: ISO 639 language code for this status.
    /// - Returns: Status
    public static func publishNewStatusWithPoll(status: String,
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
        publishNewStatus(status: status, mediaIds: mediaIds, pollOptions: pollOptions, pollExpiresIn: pollExpiresIn, pollMultiple: pollMultiple, pollHideTotals: pollHideTotals, inReplyToId: inReplyToId, sensitive: sensitive, spoilerText: spoilerText, visibility: visibility, language: language)
    }
    
    /// Post a new status.
    /// - Parameters:
    ///   - status: Text content of the status. If media_ids is provided, this becomes optional. Attaching a poll is optional while status is provided.
    ///   - mediaIds: Array of Attachment ids to be attached as media. If provided, status becomes optional, and poll cannot be used.
    ///   - pollOptions: Array of possible answers. If provided, media_ids cannot be used, and poll[expires_in] must be provided.
    ///   - pollExpiresIn: Duration the poll should be open, in seconds. If provided, media_ids cannot be used, and poll[options] must be provided.
    ///   - pollMultiple: Allow multiple choices?
    ///   - pollHideTotals: Hide vote counts until the poll ends?
    ///   - inReplyToId: ID of the status being replied to, if status is a reply
    ///   - sensitive: Mark status and attached media as sensitive?
    ///   - spoilerText: Text to be shown as a warning or subject before the actual content. Statuses are generally collapsed behind this field.
    ///   - visibility: Visibility of the posted status. Enumerable oneOf public, unlisted, private, direct.
    ///   - language: ISO 639 language code for this status.
    /// - Returns: Status
    public static func publishNewStatusWithMedia(status: String,
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
        publishNewStatus(status: status, mediaIds: mediaIds, pollOptions: pollOptions, pollExpiresIn: pollExpiresIn, pollMultiple: pollMultiple, pollHideTotals: pollHideTotals, inReplyToId: inReplyToId, sensitive: sensitive, spoilerText: spoilerText, visibility: visibility, language: language)
    }
    
    /// Post a new status.
    /// Endpoint: `/api/v1/statuses`
    /// - Parameters:
    ///   - status: Text content of the status. If media_ids is provided, this becomes optional. Attaching a poll is optional while status is provided.
    ///   - mediaIds: Array of Attachment ids to be attached as media. If provided, status becomes optional, and poll cannot be used.
    ///   - pollOptions: Array of possible answers. If provided, media_ids cannot be used, and poll[expires_in] must be provided.
    ///   - pollExpiresIn: Duration the poll should be open, in seconds. If provided, media_ids cannot be used, and poll[options] must be provided.
    ///   - pollMultiple: Allow multiple choices?
    ///   - pollHideTotals: Hide vote counts until the poll ends?
    ///   - inReplyToId: ID of the status being replied to, if status is a reply
    ///   - sensitive: Mark status and attached media as sensitive?
    ///   - spoilerText: Text to be shown as a warning or subject before the actual content. Statuses are generally collapsed behind this field.
    ///   - visibility: Visibility of the posted status. Enumerable oneOf public, unlisted, private, direct.
    ///   - language: ISO 639 language code for this status.
    /// - Returns: Status
    public static func publishNewStatus(status: String,
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
    
    /// Post a new status.
    /// Endpoint: `/api/v1/statuses`
    /// - Parameters:
    ///   - status: Text content of the status. If media_ids is provided, this becomes optional. Attaching a poll is optional while status is provided.
    ///   - scheduledAt：ISO 8601 Datetime at which to schedule a status. Providing this paramter will cause ScheduledStatus to be returned instead of Status. Must be at least 5 minutes in the future.
    ///   - mediaIds: Array of Attachment ids to be attached as media. If provided, status becomes optional, and poll cannot be used.
    ///   - pollOptions: Array of possible answers. If provided, media_ids cannot be used, and poll[expires_in] must be provided.
    ///   - pollExpiresIn: Duration the poll should be open, in seconds. If provided, media_ids cannot be used, and poll[options] must be provided.
    ///   - pollMultiple: Allow multiple choices?
    ///   - pollHideTotals: Hide vote counts until the poll ends?
    ///   - inReplyToId: ID of the status being replied to, if status is a reply
    ///   - sensitive: Mark status and attached media as sensitive?
    ///   - spoilerText: Text to be shown as a warning or subject before the actual content. Statuses are generally collapsed behind this field.
    ///   - visibility: Visibility of the posted status. Enumerable oneOf public, unlisted, private, direct.
    ///   - language: ISO 639 language code for this status.
    /// - Returns: Status
    public static func publishSchedulededStatus(status: String,
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
    
    /// View information about a status.
    /// Endpoint: /api/v1/statuses/:id
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func viewSpecificStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)", method: .GET(.EMPTY))
    }
    
    /// Delete one of your own statuses.
    /// Endpoint: `/api/v1/statuses/:id`
    /// - Parameter id: Local ID of a status in the database. Must be owned by authenticated account.
    /// - Returns: Status with source text and media_attachments or poll
    public static func deleteStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)", method: .DELETE(.EMPTY))
    }
    
    /// View statuses above and below this status in the thread.
    /// Endpoint: `/api/v1/statuses/:id/context`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Context
    public static func parentAndChildStatuses(id: String) -> Request<Context> {
        return Request(path: "/api/v1/statuses/\(id)/context", method: .GET(.EMPTY))
    }
    
    /// View who boosted a given status.
    /// Endpoint: `/api/v1/statuses/:id/reblogged_by`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Array of Account
    public static func boostedByAccounts(withId id: String) -> Request<[Account]> {
        return Request(path: "/api/v1/statuses/\(id)/reblogged_by", method: .GET(.EMPTY))
    }
    
    /// View who favourited a given status.
    /// Endpoint: `/api/v1/statuses/:id/favourited_by`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Array of Account
    public static func favouritedByAccounts(withId id: String) -> Request<[Account]> {
        return Request(path: "/api/v1/statuses/\(id)/favourited_by", method: .GET(.EMPTY))
    }
    
    /// Add a status to your favourites list.
    /// Endpoint: `/api/v1/statuses/:id/favourite`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func favouriteStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/favourite", method: .POST(.EMPTY))
    }
    
    /// Remove a status from your favourites list.
    /// Endpoint: `/api/v1/statuses/:id/unfavourite`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func unfavouriteStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unfavourite", method: .POST(.EMPTY))
    }
    
    /// Reshare a status.
    /// Endpoint: `/api/v1/statuses/:id/reblog`
    /// - Parameters:
    ///   - id: Local ID of a status in the database.
    ///   - visibility: any visibility except limited or direct (i.e. public, unlisted, private). Defaults to public. Currently unused in UI.
    /// - Returns: Status
    public static func boostStatus(id: String, visibility: VisibilityType? = nil) -> Request<Status> {
        let parameters = [Parameter(key: "visibility", value: visibility?.rawValue)]
        return Request(path: "/api/v1/statuses/\(id)/reblog", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Undo a reshare of a status.
    /// Endpoint: `/api/v1/statuses/:id/unreblog`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func unboostStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unreblog", method: .POST(.EMPTY))
    }
    
    /// Privately bookmark a status.
    /// Endpoint: `/api/v1/statuses/:id/bookmark`
    /// - Parameter id: ID of the status in the database
    /// - Returns: Status
    public static func bookmarkStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/bookmark", method: .POST(.EMPTY))
    }
    
    /// Remove a status from your private bookmarks.
    /// Endpoint: `/api/v1/statuses/:id/unbookmark`
    /// - Parameter id: ID of the status in the database
    /// - Returns: Status
    public static func unbookmarkStatus(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unbookmark", method: .POST(.EMPTY))
    }
    
    /// Do not receive notifications for the thread that this status is part of. Must be a thread in which you are a participant.
    /// Endpoint: `/api/v1/statuses/:id/mute`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func muteConversation(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unmute", method: .POST(.EMPTY))
    }
    
    /// Start receiving notifications again for the thread that this status is part of.
    /// Endpoint: `/api/v1/statuses/:id/unmute`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func unmuteConversation(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unmute", method: .POST(.EMPTY))
    }
    
    /// Feature one of your own public statuses at the top of your profile.
    /// Endpoint: `/api/v1/statuses/:id/pin`
    /// - Parameter id: Local ID of a status in the database. The status should be public and authored by the authorized account.
    /// - Returns: Status
    public static func pinToProfile(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/pin", method: .POST(.EMPTY))
    }
    
    /// Unfeature a status from the top of your profile.
    /// Endpoint: `/api/v1/statuses/:id/unpin`
    /// - Parameter id: Local ID of a status in the database.
    /// - Returns: Status
    public static func unpinToProfile(id: String) -> Request<Status> {
        return Request(path: "/api/v1/statuses/\(id)/unpin", method: .POST(.EMPTY))
    }
}
