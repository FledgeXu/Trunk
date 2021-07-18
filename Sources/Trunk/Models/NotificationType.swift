//
//  NotificationType.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum NotificationType: String, Codable {
    /// Someone followed you
    case follow
    /// Someone requested to follow you
    case follow_request
    /// Someone mentioned you in their status
    case mention
    /// Someone boosted one of your statuses
    case reblog
    /// Someone favourited one of your statuses
    case favourite
    /// A poll you have voted in or created has ended
    case poll
    /// Someone you enabled notifications for has posted a status
    case status
}
