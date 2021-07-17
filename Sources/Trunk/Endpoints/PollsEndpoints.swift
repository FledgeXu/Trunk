//
//  PollsEndpoints.swift
//  
//
//  Created by Fledge Shiu on 2021/7/17.
//

import Foundation

public enum PollsEndpoints {
    public static func getPoll(id: String) -> Request<Poll> {
        return Request(path: "/api/v1/polls/\(id)", method: .GET(.EMPTY))
    }
}
