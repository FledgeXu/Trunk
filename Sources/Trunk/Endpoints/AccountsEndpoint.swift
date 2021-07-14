//
//  AccountsEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public struct AccountsFiltersParameters: Encodable {
    let phrase: String
    let context: [FilterContextType]
    let irreversible: Bool?
    let wholeWord: Bool?
    let expiresIn: Int?
    
    private enum CodingKeys: String, CodingKey {
        case phrase
        case context
        case irreversible
        case wholeWord = "whole_word"
        case expiresIn = "expires_in"
    }
    public init(phrase: String, context: [FilterContextType], irreversible: Bool? = nil, wholeWord: Bool? = nil, expiresIn: Int? = nil) {
        self.phrase = phrase
        self.context = context
        self.irreversible = irreversible
        self.wholeWord = wholeWord
        self.expiresIn = expiresIn
    }
}

public enum AccountsEndpoint {
    public static func verifyCredentials() -> Request<Account, EmptyEndpointParameters> {
        return Request(path: "/api/v1/accounts/verify_credentials", method: .GET(.EMPTY))
    }
    
    public static func filters(parameters: AccountsFiltersParameters) -> Request<Filter, AccountsFiltersParameters> {
        return Request(path: "/api/v1/filters", method: .POST(.PARAMETERS(parameters)))
    }
}
