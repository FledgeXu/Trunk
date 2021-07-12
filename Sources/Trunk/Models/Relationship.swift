//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents the relationship between accounts, such as following / blocking / muting / etc.
public class Relationship: Codable {
    /// The account id.
    public let id: String
    /// Are you following this user?
    public let following: Bool
    /// Do you have a pending follow request for this user?
    public let requested: Bool
    /// Are you featuring this user on your profile?
    public let endorsed: Bool
    /// Are you followed by this user?
    public let followedBy: Bool
    /// Are you muting this user?
    public let muting: Bool
    /// Are you muting notifications from this user?
    public let mutingNotifications: Bool
    /// Are you receiving this user's boosts in your home timeline?
    public let showingReblogs: Bool
    /// Are you receiving this user's boosts in your home timeline?
    public let notifying: Bool
    /// Are you blocking this user?
    public let blocking: Bool
    /// Are you blocking this user's domain?
    public let domainBlocking: Bool
    ///  Is this user blocking you?
    public let blockedBy: Bool
    /// Is this user blocking you?
    public let note: String

    private enum CodingKeys: String, CodingKey {
        case id
        case following
        case showingReblogs = "showing_reblogs"
        case notifying
        case followedBy = "followed_by"
        case blocking
        case blockedBy = "blocked_by"
        case muting
        case mutingNotifications = "muting_notifications"
        case requested
        case domainBlocking = "domain_blocking"
        case endorsed
        case note
    }
}
