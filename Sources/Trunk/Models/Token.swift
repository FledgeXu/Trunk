//
//  Token.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a mention of a user within the content of a status.
public final class Token: Codable {
    /// An OAuth token to be used for authorization.
    public let accessToken: String
    /// The OAuth token type. Mastodon uses Bearer tokens.
    public let tokenType: String
    /// The OAuth scopes granted by this token, space-separated.
    public let scope: [OAuthScopes]
    /// When the token was generated.
    public let createdAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
        case createdAt = "created_at"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decode(String.self, forKey: .accessToken)
        tokenType = try values.decode(String.self, forKey: .tokenType)
        createdAt = try values.decode(Date.self, forKey: .createdAt)
        let scopeRaw = try values.decode(String.self, forKey: .scope)
        scope = scopeRaw.split(separator: " ").map(String.init).map { s in
            OAuthScopes(rawValue: s)!
        }
    }
}
