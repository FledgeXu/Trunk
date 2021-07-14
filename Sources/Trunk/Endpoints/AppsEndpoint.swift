//
//  AppsEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public struct AppsCreateApplicationParameters: Encodable {
    let clientName: String
    let redirectUris: String
    let scopes: [OAuthScopes]?
    let website: String?
    
    private enum CodingKeys: String, CodingKey {
        case clientName = "client_name"
        case redirectUris = "redirect_uris"
        case scopes
        case website
    }
    public init(clientName: String, redirectUris: String = "urn:ietf:wg:oauth:2.0:oob", scopes: [OAuthScopes]? = nil, website: String? = nil) {
        self.clientName = clientName
        self.redirectUris = redirectUris
        self.scopes = scopes
        self.website = website
    }
}

public enum AppsEndpoint {
    public static func createApplication(parameters: AppsCreateApplicationParameters) -> Request<Application, AppsCreateApplicationParameters> {
        return Request(path: "/api/v1/apps", method: .POST(.PARAMETERS(parameters)))
    }
    
    public static func verifyCredentials() -> Request<Application, EmptyEndpointParameters> {
        return Request(path: "/api/v1/apps/verify_credentials", method: .GET(.EMPTY))
    }
}
