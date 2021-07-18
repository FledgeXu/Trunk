//
//  PollsEndpoints.swift
//  
//
//  Created by Fledge Shiu on 2021/7/17.
//

import Foundation

public enum PollsEndpoints {
    
    /// View a poll
    /// Endpoint: `/api/v1/polls/:id`
    /// - Parameter id: ID of the poll in the database
    /// - Returns: Poll
    public static func viewPoll(id: String) -> Request<Poll> {
        return Request(path: "/api/v1/polls/\(id)", method: .GET(.EMPTY))
    }
    
    /// Vote on a poll
    /// Endpoint: `/api/v1/polls/:id/votes`
    /// - Parameters:
    ///   - id: ID of the poll in the database
    ///   - choices: Array of own votes containing index for each option (starting from 0)
    /// - Returns: Poll
    public static func voteOnPoll(id: String, choices: [Int]) -> Request<Poll> {
        let parameters = choices.map { choice in
            return Parameter(key: "choices[]", value: String(choice))
        }
        return Request(path: "/api/v1/polls/\(id)/votes", method: .POST(.PARAMETERS(parameters)))
    }
}
