//
//  AppsEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation

public enum AppsEndpoint {
    
    /// Create a new application to obtain OAuth2 credentials.
    /// Endpoint: `/api/v1/apps`
    /// - Parameters:
    ///   - clientName: A name for your application
    ///   - redirectUris: Where the user should be redirected after authorization. To display the authorization code to the user instead of redirecting to a web page, use `urn:ietf:wg:oauth:2.0:oob` in this parameter.
    ///   - scopes: Space separated list of scopes. If none is provided, defaults to `read`.
    ///   - website: A URL to the homepage of your app
    /// - Returns: Application, with `client_id` and `client_secret`
    public static func createApplication(clientName: String,
                                         redirectUris: String = "urn:ietf:wg:oauth:2.0:oob",
                                         scopes: [OAuthScopes]? = nil,
                                         website: String? = nil) -> Request<Application> {
        let parameters = [
            Parameter(key: "client_name", value: clientName),
            Parameter(key: "redirect_uris", value: redirectUris),
            Parameter(key: "scopes", value: scopes?.toString()),
            Parameter(key: "website", value: website)
        ]
        return Request(path: "/api/v1/apps", method: .POST(.PARAMETERS(parameters)))
    }
    
    
    /// Confirm that the app's OAuth2 credentials work.
    /// Endpoint: `/api/v1/apps/verify_credentials`
    /// - Returns: Application
    public static func verifyAppWorks() -> Request<Application> {
        return Request(path: "/api/v1/apps/verify_credentials", method: .GET(.EMPTY))
    }
}
