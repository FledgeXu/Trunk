//
//  AppsEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public enum AppsEndpoint {
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
    
    public static func verifyCredentials() -> Request<Application> {
        return Request(path: "/api/v1/apps/verify_credentials", method: .GET(.EMPTY))
    }
}
