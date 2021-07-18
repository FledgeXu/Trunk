//
//  OauthEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation

public enum OAuthEndpoint {
    
    /// Returns an access token, to be used during API calls that are not public.
    /// Endpoint: `/oauth/token`
    /// - Parameters:
    ///   - clientId: Client ID, obtained during app registration
    ///   - clientSecret: Client secret, obtained during app registration
    ///   - redirectUri: Set a URI to redirect the user to. If this parameter is set to `urn:ietf:wg:oauth:2.0:oob` then the token will be shown instead. Must match one of the redirect URIs declared during app registration.
    ///   - grantType: Set equal to `authorization_code` if code is provided in order to gain user-level access. Otherwise, set equal to `client_credentials` to obtain app-level access only.
    ///   - code: A user authorization code, obtained via /oauth/authorize
    ///   - scope: List of requested OAuth scopes, separated by spaces. Must be a subset of scopes declared during app registration. If not provided, defaults to `read`.
    /// - Returns: Returns an access token, to be used during API calls that are not public.
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
    
    
    /// Revoke an access token to make it no longer valid for use.
    /// Endpoint: `/oauth/revoke`
    /// - Parameters:
    ///   - clientId: Client ID, obtained during app registration
    ///   - clientSecret: Client secret, obtained during app registration
    ///   - token: The previously obtained token, to be invalidated
    /// - Returns: Empty
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
