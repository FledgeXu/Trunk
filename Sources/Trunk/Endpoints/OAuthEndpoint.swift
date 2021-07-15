//
//  OauthEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public enum OAuthEndpoint {
    public static func obtainToken(clientId: String,
                                   clientSecret: String,
                                   redirectUri: String = "urn:ietf:wg:oauth:2.0:oob",
                                   grantType: String = "authorization_code",
                                   code: String,
                                   scope: [OAuthScopes]? = nil) -> Request<Token> {
        let parameters = [
            Parameter(key: "client_id", value: clientId),
            Parameter(key: "client_secret", value: clientSecret),
            Parameter(key: "redirect_uri", value: redirectUri),
            Parameter(key: "grant_type", value: grantType),
            Parameter(key: "scope", value: scope?.toString()),
            Parameter(key: "code", value: code)
        ]
        return Request(path: "/oauth/token", method: .POST(.PARAMETERS(parameters)))
    }
    
    public static func revokeToken(clientId: String,
                                   clientSecret: String,
                                   token: String) -> Request<Empty> {
        let parameters = [
            Parameter(key: "client_id", value: clientId),
            Parameter(key: "client_secret", value: clientSecret),
            Parameter(key: "token", value: token)
        ]
        return Request(path: "/oauth/revoke", method: .POST(.PARAMETERS(parameters)))
    }
}
