//
//  AccountsEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation

public enum AccountsEndpoint {
    
    /// Test to make sure that the user token works.
    /// Endpoint: `/api/v1/accounts/update_credentials`
    /// - Returns: the user's own Account with Source
    public static func verifyAccountCredentials() -> Request<Account> {
        return Request(path: "/api/v1/accounts/verify_credentials")
    }
    
    public static func filters(phrase: String,
                               context: [FilterContextType],
                               irreversible: Bool? = nil,
                               wholeWord: Bool? = nil,
                               expiresIn: Int? = nil) -> Request<Filter> {
        var parameters = [
            Parameter(key: "phrase", value: phrase),
            Parameter(key: "irreversible", value: irreversible.flatMap(trueOrNil)),
            Parameter(key: "whole_word", value: wholeWord.flatMap(trueOrNil)),
            Parameter(key: "expires_in", value: expiresIn.map(String.init))
        ]
        context.forEach { type in
            parameters.append(Parameter(key: "context[]", value: type.rawValue))
        }
        return Request(path: "/api/v1/filters", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Update the user's display and preferences.
    /// Endpoint: `/api/v1/accounts/update_credentials`
    /// - Parameters:
    ///   - discoverable: Whether the account should be shown in the profile directory.
    ///   - bot: Whether the account has a bot flag.
    ///   - displayName: The display name to use for the profile.
    ///   - note: The account bio.
    ///   - avatar: Avatar image encoded using multipart/form-data
    ///   - header: Header image encoded using multipart/form-data
    ///   - locked: Whether manual approval of follow requests is required.
    ///   - sourcePrivacy: Default post privacy for authored statuses.
    ///   - sourceSensitive: Whether to mark authored statuses as sensitive by default.
    ///   - sourceLanguage: Default language to use for authored statuses. (ISO 6391)
    ///   - fieldsAttributes: Profile metadata name and value. (By default, max 4 fields and 255 characters per property/value)
    /// - Returns: the user's own Account with Source
    public static func updateAccountCredentials(discoverable: String? = nil,
                                         bot: Bool? = nil,
                                         displayName: String? = nil,
                                         note: String? = nil,
                                         avatar: Data? = nil,
                                         header: Data? = nil,
                                         locked: Bool? = nil,
                                         sourcePrivacy: String? = nil,
                                         sourceSensitive: Bool? = nil,
                                         sourceLanguage: String? = nil,
                                         fieldsAttributes: [Field]? = nil) -> Request<Account> {
        var parameters = [
            Parameter(key: "discoverable", value: discoverable),
            Parameter(key: "bot", value: bot.flatMap(trueOrNil)),
            Parameter(key: "display_name", value: displayName),
            Parameter(key: "note", value: note),
            Parameter(key: "locked", value: locked.flatMap(trueOrNil)),
            Parameter(key: "source[privacy]", value: sourcePrivacy),
            Parameter(key: "source[sensitive]", value: sourceSensitive.flatMap(trueOrNil)),
            Parameter(key: "source[language]", value: sourceLanguage)
        ]
        if let fields = fieldsAttributes {
            for (index, field) in fields.enumerated() {
                parameters.append(Parameter(key: "fields_attributes[\(index)][name]", value: field.name))
                parameters.append(Parameter(key: "fields_attributes[\(index)][value]", value: field.value))
                parameters.append(Parameter(key: "fields_attributes[\(index)][verified_at]", value: field.verifiedAt))
            }
        }
        let dataParameters = [
            DataParameter(key: "avatar", value: avatar),
            DataParameter(key: "header", value: header)
        ]
        
        return Request(path: "/api/v1/accounts/update_credentials", method: .PATCH(.MEDIA(parameters, dataParameters)))
    }
    
    /// View information about a profile.
    /// Endpoint: `/api/v1/accounts/:id`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Account
    public static func account(id: String) -> Request<Account> {
        return Request(path: "/api/v1/accounts/\(id)")
    }
    
    /// Statuses posted to the given account.
    /// Endpoint: `/api/v1/accounts/:id/statuses`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Array of Status
    public static func statuses(id: String) -> Request<[Status]> {
        return Request(path: "/api/v1/accounts/\(id)/statuses")
    }
    
    /// Accounts which follow the given account, if network is not hidden by the account owner.
    /// Endpoint: `/api/v1/accounts/:id/followers`
    /// - Parameters:
    ///   - id: The id of the account in the database
    ///   - maxId:
    ///   - sinceId:
    ///   - limit:
    /// - Returns: Array of Account
    public static func followers(id: String, maxId: String? = nil, sinceId: String? = nil, limit: Int? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
        ]
        return Request(path: "/api/v1/accounts/\(id)/followers", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Accounts which the given account is following, if network is not hidden by the account owner.
    /// Endpoint: `/api/v1/accounts/:id/following`
    /// - Parameters:
    ///   - id: The id of the account in the database
    ///   - maxId: Internal parameter. Use HTTP Link header for pagination.
    ///   - sinceId: Internal parameter. Use HTTP Link header for pagination.
    ///   - limit: Maximum number of results to return. Defaults to 40.
    /// - Returns: Array of Account
    public static func following(id: String, maxId: String? = nil, sinceId: String? = nil, limit: Int? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters = [
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
        ]
        return Request(path: "/api/v1/accounts/\(id)/following", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Tags featured by this account.
    /// Endpoint: `/api/v1/accounts/:id/featured_tags`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Array of FeaturedTag
    public static func featuredTags(id: String) -> Request<[FeaturedTag]> {
        return Request(path: "/api/v1/accounts/\(id)/featured_tags")
    }
    
    /// User lists that you have added this account to.
    /// Endpoint: `/api/v1/accounts/:id/lists`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Array of List
    public static func listsContainingThisAccount(id: String) -> Request<[List]> {
        return Request(path: "/api/v1/accounts/\(id)/lists")
    }
    
    /// User Identity Proofs
    /// Endpoint: `/api/v1/accounts/:id/identity_proofs`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Array of IdentityProof
    public static func identityProofs(id: String) -> Request<[IdentityProof]> {
        return Request(path: "/api/v1/accounts/\(id)/identity_proofs")
    }
    
    /// Follow the given account. Can also be used to update whether to show reblogs or enable notifications.
    /// Endpoint: `/api/v1/accounts/:id/follow`
    /// - Parameters:
    ///   - id: The id of the account in the database
    ///   - reblogs: Receive this account's reblogs in home timeline? Defaults to true.
    ///   - notify: Receive notifications when this account posts a status? Defaults to `false`.
    /// - Returns: Relationship
    public static func follow(id: String, reblogs: Bool? = nil, notify: Bool? = nil) -> Request<Relationship> {
        let parameters = [
            Parameter(key: "reblogs", value: reblogs.flatMap(trueOrNil)),
            Parameter(key: "notify", value: notify.flatMap(trueOrNil))
        ]
        return Request(path: "/api/v1/accounts/\(id)/follow", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Unfollow the given account.
    /// Endpoint: `/api/v1/accounts/:id/unfollow`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Relationship
    public static func unfollow(id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/accounts/\(id)/unfollow", method: .POST(.EMPTY))
    }
    
    /// Block the given account. Clients should filter statuses from this account if received (e.g. due to a boost in the Home timeline)
    /// Endpoint: `/api/v1/accounts/:id/block`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Relationship
    public static func block(id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/accounts/\(id)/block", method: .POST(.EMPTY))
    }
    
    /// Unblock the given account.
    /// Endpoint: `/api/v1/accounts/:id/unblock`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Relationship
    public static func unblock(id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/accounts/\(id)/unblock", method: .POST(.EMPTY))
    }
    
    /// Mute the given account. Clients should filter statuses and notifications from this account, if received (e.g. due to a boost in the Home timeline).
    /// Endpoint: `/api/v1/accounts/:id/mute`
    /// - Parameters:
    ///   - id: The id of the account in the database
    ///   - notifications: Mute notifications in addition to statuses? Defaults to `true`.
    ///   - duration: How long the mute should last, in seconds. Defaults to 0 (indefinite).
    /// - Returns: Relationship
    public static func mute(id: String, notifications: Bool? = nil, duration: Int? = nil) -> Request<Relationship> {
        let parameters = [
            Parameter(key: "notifications", value: notifications.flatMap(trueOrNil)),
            Parameter(key: "duration", value: duration.flatMap(toOptionalString))
        ]
        return Request(path: "/api/v1/accounts/\(id)/mute", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Unmute the given account.
    /// Endpoint: `/api/v1/accounts/:id/unmute`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Relationship
    public static func unmute(id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/accounts/\(id)/unmute", method: .POST(.EMPTY))
    }
    
    /// Add the given account to the user's featured profiles. (Featured profiles are currently shown on the user's own public profile.)
    /// Endpoint: `/api/v1/accounts/:id/pin`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Relationship
    public static func featureOnProfile(withId id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/accounts/\(id)/pin", method: .POST(.EMPTY))
    }
    
    /// Remove the given account from the user's featured profiles.
    /// Endpoint: `/api/v1/accounts/:id/unpin`
    /// - Parameter id: The id of the account in the database
    /// - Returns: Relationship
    public static func unfeatureOnProfile(withId id: String) -> Request<Relationship> {
        return Request(path: "/api/v1/accounts/\(id)/unpin", method: .POST(.EMPTY))
    }
    
    /// Sets a private note on a user.
    /// Endpoint: `/api/v1/accounts/:id/note`
    /// - Parameters:
    ///   - id: The id of the account in the database
    ///   - comment: The comment to be set on that user. Provide an empty string or leave out this parameter to clear the currently set note.
    /// - Returns: Relationship
    public static func userNote(id: String, comment: String? = nil) -> Request<Relationship> {
        let parameters = [
            Parameter(key: "comment", value: comment)
        ]
        return Request(path: "/api/v1/accounts/\(id)/note", method: .POST(.PARAMETERS(parameters)))
    }
    
    /// Find out whether a given account is followed, blocked, muted, etc.
    /// Endpoint: `/api/v1/accounts/relationships`
    /// - Parameter ids: Array of account IDs to check
    /// - Returns: Array of Relationship
    public static func checkRelationshipsToOtherAccounts(withIds ids: [Int]) -> Request<[Relationship]> {
        var parameters: [Parameter] = []
        ids.forEach({ value in
            parameters.append(Parameter(key: "id[]", value: String(value)))
        })
        return Request(path: "/api/v1/accounts/relationships", method: .GET(.PARAMETERS(parameters)))
    }
    
    /// Search for matching accounts by username or display name.
    /// Endpoint: `/api/v1/accounts/search`
    /// - Parameters:
    ///   - q: What to search for
    ///   - limit: Maximum number of results. Defaults to 40.
    ///   - resolve: Attempt WebFinger lookup. Defaults to false. Use this when `q` is an exact address.
    ///   - following: Only who the user is following. Defaults to `false`.
    /// - Returns: Array of Account
    public static func searchForMatchingAccounts(keyword q: String,
                                      limit: Int? = nil,
                                      resolve: Bool? = nil,
                                      following: Bool? = nil) -> Request<[Account]> {
        let toLimitBounds = between(1, and: 80, default: 40)
        let parameters: [Parameter] = [
            Parameter(key: "q", value: q),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "resolve", value: resolve.flatMap(trueOrNil)),
            Parameter(key: "following", value: following.flatMap(trueOrNil)),
        ]
        return Request(path: "/api/v1/accounts/search", method: .GET(.PARAMETERS(parameters)))
    }
}
