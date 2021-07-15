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
    
    public static func filters(phrase: String,
                               context: [FilterContextType],
                               irreversible: Bool? = nil,
                               wholeWord: Bool? = nil,
                               expiresIn: Int? = nil) -> Request<Filter> {
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
    
    public static func updateCredentials(discoverable: String? = nil,
                                         bot: Bool? = nil,
                                         displayName: String? = nil,
                                         note: String? = nil,
                                         avatar: Data? = nil,
                                         header: Data? = nil,
                                         locked: Bool? = nil,
                                         sourcePrivacy: String? = nil,
                                         sourceSensitive: Bool? = nil,
                                         sourceLanguage: String? = nil,
                                         fieldsAttributes: [Field]? = nil) -> Request<Account> {
        var parameters = [
            Parameter(key: "discoverable", value: discoverable),
            Parameter(key: "bot", value: bot.flatMap(trueOrNil)),
            Parameter(key: "display_name", value: displayName),
            Parameter(key: "note", value: note),
            Parameter(key: "locked", value: locked.flatMap(trueOrNil)),
            Parameter(key: "source[privacy]", value: sourcePrivacy),
            Parameter(key: "source[sensitive]", value: sourceSensitive.flatMap(trueOrNil)),
            Parameter(key: "source[language]", value: sourceLanguage)
        ]
        if let fields = fieldsAttributes {
            for (index, field) in fields.enumerated() {
                parameters.append(Parameter(key: "fields_attributes[\(index)][name]", value: field.name))
                parameters.append(Parameter(key: "fields_attributes[\(index)][value]", value: field.value))
                parameters.append(Parameter(key: "fields_attributes[\(index)][verified_at]", value: field.verifiedAt))
            }
        }
        let dataParameters = [
            DataParameter(key: "avatar", value: avatar),
            DataParameter(key: "header", value: header)
        ]
        
        return Request(path: "/api/v1/accounts/update_credentials", method: .PATCH(.MEDIA(parameters, dataParameters)))
    }
    
    public static func retrieveInformation(id: Int) -> Request<Account> {
        return Request(path: "/api/v1/accounts/\(id)")
    }
}
