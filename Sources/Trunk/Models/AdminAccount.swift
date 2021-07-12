//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Admin-level information about a given account.
public class AdminAccount: Codable {
    
    // Attributes
    /// The ID of the account in the database.
    public let id: String
    /// The username of the account.
    public let username: String
    /// The domain of the account.
    public let domain: String
    /// When the account was first discovered.
    public let createdAt: Date
    /// The email address associated with the account.
    public let email: String
    /// The IP address last used to login to this account.
    public let ip: String
    /// The locale of the account.
    public let locale: String
    /// Invite request text.
    public let inviteRequest: String
    
    // State attributes
    /// The current role of the account.
    public let role: String
    /// Whether the account has confirmed their email address.
    public let confirmed: Bool
    /// Whether the account is currently approved.
    public let approved: Bool
    /// Whether the account is currently disabled.
    public let disabled: Bool
    /// Whether the account is currently silenced.
    public let silenced: Bool
    /// Whether the account is currently suspended.
    public let suspended: Bool
    /// User-level information about the account.
    public let account: Account
    
    // Nullable attributes
    /// The ID of the application that created this account.
    public let createdByApplicationId: String?
    /// The ID of the account that invited this user
    public let invitedByAccountId: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case domain
        case createdAt = "created_at"
        case email
        case ip
        case locale
        case inviteRequest = "invite_request"
        case role
        case confirmed
        case approved
        case disabled
        case silenced
        case suspended
        case account
        case createdByApplicationId = "created_by_application_id"
        case invitedByAccountId = "invited_by_account_id"
    }
}
