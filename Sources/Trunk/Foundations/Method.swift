//
//  Method.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation
import Alamofire

public enum Method<T: Encodable> {
    case GET(Payload<T>)
    case POST(Payload<T>)
    case PUT(Payload<T>)
    case PATCH(Payload<T>)
    
    var parameters: Payload<T> {
        switch self {
        case .GET(let parameters), .POST(let parameters), .PUT(let parameters), .PATCH(let parameters):
            return parameters
        }
    }
    var type: HTTPMethod  {
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        case .PUT:
            return .put
        case .PATCH:
            return .patch
        }
    }
}
