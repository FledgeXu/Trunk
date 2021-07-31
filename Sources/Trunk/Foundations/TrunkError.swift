//
//  TrunkError.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum TrunkError: Swift.Error {
    case urlError
    case dataTaskError(Swift.Error)
    case malformedData
    case responseErrorWithErrorType(MastodonError)
    case responseErrorWithoutErrorType(String?)
    case modelParseError(Swift.Error)
}
