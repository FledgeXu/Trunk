//
//  Request.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation

public struct Request<Model: Codable>{
    let path: String
    let method: Method

    init(path: String, method: Method = .GET(.EMPTY)) {
        self.path = path
        self.method = method
    }
}
