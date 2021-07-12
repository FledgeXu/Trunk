//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/26.
//

import Foundation

public class OAuthToekn: Codable {
    public let accessToken: String
    public let tokenType: String
    public let scope: String
    public let createdAt: Int
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
        case createdAt = "created_at"
    }
}
