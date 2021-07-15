//
//  AccountsEndpoint.swift
//
//
//  Created by Fledge Shiu on 2021/4/23.
//

import Foundation
import Alamofire

public enum AccountsEndpoint {
    public static func verifyCredentials() -> Request<Account> {
        return Request(path: "/api/v1/accounts/verify_credentials")
    }
    
    public static func filters(phrase: String, context: [FilterContextType], irreversible: Bool? = nil, wholeWord: Bool? = nil, expiresIn: Int? = nil) -> Request<Filter> {
        var parameters = [
            Parameter(key: "phrase", value: phrase),
            Parameter(key: "irreversible", value: irreversible.flatMap(trueOrNil)),
            Parameter(key: "whole_word", value: wholeWord.flatMap(trueOrNil)),
            Parameter(key: "expires_in", value: expiresIn.map(String.init))
        ]
        context.forEach { type in
            parameters.append(Parameter(key: "context[]", value: type.rawValue))
        }
        return Request(path: "/api/v1/filters", method: .POST(.PARAMETERS(parameters)))
    }
}
