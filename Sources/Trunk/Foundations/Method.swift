//
//  Method.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation
import Alamofire

public enum Method {
    case GET(Payload)
    case POST(Payload)
    case PUT(Payload)
    case DELETE(Payload)
    case PATCH(Payload)
    
    var type: String  {
        switch self {
        case .GET: return "GET"
        case .POST: return "POST"
        case .PUT: return "PUT"
        case .DELETE: return "DELETE"
        case .PATCH: return "PATCH"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .GET(let payload):
            return payload.queryItems
        default:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .POST(let payload): return payload.data
        case .PUT(let payload): return payload.data
        case .DELETE(let payload): return payload.data
        case .PATCH(let payload): return payload.data
        default: return nil
        }
    }
    
    var contentType: String? {
        switch self {
        case .POST(let payload): return payload.contentType
        case .PUT(let payload): return payload.contentType
        case .PATCH(let payload): return payload.contentType
        case .DELETE(let payload): return payload.contentType
        default: return nil
        }
    }
}
