//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/15.
//

import Foundation

extension URLRequest {
    init<A>(url: URL, request: Request<A>, accessToken: String?) {
        self.init(url: url, timeoutInterval: 30)

        httpMethod = request.method.type
        httpBody = request.method.httpBody

        setValue(accessToken.map { "Bearer \($0)" }, forHTTPHeaderField: "Authorization")
        request.headers.forEach { header in
            setValue(header.value, forHTTPHeaderField: header.name)
        }
        setValue(request.method.contentType, forHTTPHeaderField: "Content-Type")
    }
}
