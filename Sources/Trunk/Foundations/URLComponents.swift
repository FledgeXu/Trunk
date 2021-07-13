//
//  URLComponents.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation

extension URLComponents {
    init?<A, B>(baseURL: String, request: Request<A, B>) {
        guard
            let realBaseURL = URL(string: baseURL),
            let completeURL = URL(string: request.path, relativeTo: realBaseURL)
            else {
                return nil
        }

        self.init(url: completeURL, resolvingAgainstBaseURL: true)

        path = request.path
    }
}
