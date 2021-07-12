//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a subscription to the push streaming server.
public class PushSubscription: Codable {
    /// The id of the push subscription in the database.
    public let id: String
    /// Where push alerts will be sent to.
    public let endpoint: URL
    /// The streaming server's VAPID key.
    public let serverKey: String
    /// Which alerts should be delivered to the endpoint.
    public let alerts: AlertsType
    public class AlertsType: Codable {
        /// Receive a push notification when someone has followed you?
        public let follow: Bool
        /// Receive a push notification when a status you created has been favourited by someone else?
        public let favourite: Bool
        /// Receive a push notification when someone else has mentioned you in a status?
        public let mention: Bool
        /// Receive a push notification when a status you created has been boosted by someone else?
        public let reblog: Bool
        /// Receive a push notification when a poll you voted in or created has ended?
        public let poll: Bool
        
        private enum CodingKeys: String, CodingKey {
            case follow
            case favourite
            case mention
            case reblog
            case poll
        }
    }
    private enum CodingKeys: String, CodingKey {
        case id
        case endpoint
        case serverKey = "server_key"
        case alerts
    }
}
