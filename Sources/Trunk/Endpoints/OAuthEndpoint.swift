//
//  OauthEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public struct OAuthObtainTokenParameters: Encodable {
    let clientId: String
    let clientSecret: String
    let redirectUri: String
    let grantType: String
    let scope: String?
    let code: String
    
    private enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case redirectUri = "redirect_uri"
        case grantType = "grant_type"
        case scope
        case code
    }
    public init(clientId: String, clientSecret: String, redirectUri: String = "urn:ietf:wg:oauth:2.0:oob", grantType: String = "authorization_code", code: String, scope: [OAuthScopes]? = nil) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.grantType = grantType
        self.scope = scope?.toString()
        self.code = code
    }
}

public struct OAuthRevokeTokenParameters: Encodable {
    let clientId: String
    let clientSecret: String
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case token
    }
    public init(clientId: String, clientSecret: String, token: String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.token = token
    }
}

public enum OAuthEndpoint {
    public static func obtainToken(parameters: OAuthObtainTokenParameters) -> Request<Token, OAuthObtainTokenParameters> {
        return Request(path: "/oauth/token", method: .POST(.PARAMETERS(parameters)))
    }
    
    public static func revokeToken(parameters: OAuthRevokeTokenParameters) -> Request<Empty, OAuthRevokeTokenParameters> {
        return Request(path: "/oauth/revoke", method: .POST(.PARAMETERS(parameters)))
    }
}
