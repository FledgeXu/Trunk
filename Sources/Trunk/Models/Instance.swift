//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents the software instance of Mastodon running on this domain.
public class Instance: Codable {
    // Required attributes
    /// The domain name of the instance.
    public let uri: String
    /// The title of the website.
    public let title: String
    /// Admin-defined description of the Mastodon site.
    public let description: String
    /// A shorter description defined by the admin.
    public let shortDescription: String
    /// An email that may be contacted for any inquiries.
    public let email: String
    /// The version of Mastodon installed on the instance.
    public let version: String
    /// Primary langauges of the website and its staff.
    public let languages: [String]
    /// Whether registrations are enabled.
    public let registrations: Bool
    /// Whether registrations require moderator approval.
    public let approvalRequired: Bool
    /// Whether invites are enabled.
    public let invitesEnabled: Bool
    /// URLs of interest for clients apps.
    /// urls[streaming_api]
    /// Websockets address for push streaming. String (URL).
    public let urls: URLsType
    /// Statistics about how much information the instance contains.
    public let stats: StatsType
    
    // Optional attributes
    /// Banner image for the website.
    public let thumbnail: URL?
    /// A user that can be contacted, as an alternative to email
    public let contactAccount: Account?
    
    public class URLsType: Codable {
        public let streamingApi: String
        
        private enum CodingKeys: String, CodingKey {
            case streamingApi = "streaming_api"
        }
    }
    
    public class StatsType: Codable {
        /// Users registered on this instance. Number.
        public let userCount: Int
        /// Statuses authored by users on instance. Number.
        public let statusCount: Int
        /// Domains federated with this instance. Number.
        public let domainCount: Int
        
        private enum CodingKeys: String, CodingKey {
            case userCount = "user_count"
            case statusCount = "status_count"
            case domainCount = "domain_count"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case uri
        case title
        case description
        case shortDescription = "short_description"
        case email
        case version
        case languages
        case registrations
        case approvalRequired = "approval_required"
        case invitesEnabled = "invites_enabled"
        case urls
        case stats
        case thumbnail
        case contactAccount = "contact_account"
    }
}
