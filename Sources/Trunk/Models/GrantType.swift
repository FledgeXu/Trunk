//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/26.
//

import Foundation

public enum GrantType: String, Codable {
    case authorizationCode = "authorization_code"
    case clientCredentials = "client_credentials"
}
