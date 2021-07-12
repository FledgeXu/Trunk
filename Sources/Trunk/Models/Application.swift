//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents an application that interfaces with the REST API to access accounts or post statuses.
public class Application: Codable {
    // Required attributes
    /// The name of your application.
    public let name: String
    
    // Optional attributes
    /// The website associated with your application.
    public let website: URL?
    /// Used for Push Streaming API. Returned with POST /api/v1/apps. Equivalent to PushSubscription#server_key
    public let vapidKey: String?
    /// Where the user should be redirected after authorization. To display the authorization code to the user instead of redirecting to a web page, use urn:ietf:wg:oauth:2.0:oob in this parameter.
    public let redirectURI: String?
    
    // Client attributes
    /// Client ID key, to be used for obtaining OAuth tokens
    public let clientId: String?
    /// Client secret key, to be used for obtaining OAuth tokens
    public let clientSecret: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case website
        case vapidKey = "vapid_key"
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case redirectURI = "redirect_uri"
    }
}
