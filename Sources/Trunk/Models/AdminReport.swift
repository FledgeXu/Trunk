//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Admin-level information about a filed report.
public class AdminReport: Codable {
    // Attributes
    /// The ID of the report in the database.
    public let id: String
    /// The action taken to resolve this report.
    public let actionTaken: String
    /// An optional reason for reporting.
    public let comment: String
    /// The time the report was filed.
    public let createdAt: Date
    /// The time of last action on this report.
    public let updatedAt: Date
    /// The account which filed the report.
    public let account: Account
    /// The account being reported.
    public let targetAccount: Account
    /// The account of the moderator assigned to this report.
    public let assignedAccount: Account
    /// The action taken by the moderator who handled the report.
    public let actionTakenByAccount: String
    /// Statuses attached to the report, for context.
    public let statuses: [Status]
    private enum CodingKeys: String, CodingKey {
        case id
        case actionTaken = "action_taken"
        case comment
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case account
        case targetAccount = "target_account"
        case assignedAccount = "assigned_account"
        case actionTakenByAccount = "action_taken_by_account"
        case statuses
    }
}
