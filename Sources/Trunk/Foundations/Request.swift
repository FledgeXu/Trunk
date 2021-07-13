//
//  Request.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation

public struct Request<Model: Codable, Parameters: Encodable>{
    let path: String
    let method: Method<Parameters>

    init(path: String, method: Method<Parameters> = .GET(.empy)) {
        self.path = path
        self.method = method
    }
}
