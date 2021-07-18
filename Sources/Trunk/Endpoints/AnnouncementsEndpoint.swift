//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum AnnouncementsEndpoint {
    public static func viewAllAnnouncements(withDismissed: Bool? = nil) -> Request<[Announcement]> {
        let parameters = [Parameter(key: "with_dismissed", value: withDismissed.flatMap(toOptionalString))]
        return Request(path: "/api/v1/announcements", method: .GET(.PARAMETERS(parameters)))
    }
    
    public static func dismissAnnouncements(id: String) -> Request<Empty> {
        return Request(path: "/api/v1/announcements/\(id)/dismiss", method: .POST(.EMPTY))
    }
    
    public static func addReaction(id: String, name: String) -> Request<Empty> {
        return Request(path: "/api/v1/announcements/\(id)/reactions/\(name)", method: .PUT(.EMPTY))
    }
    
    public static func removeReaction(id: String, name: String) -> Request<Empty> {
        return Request(path: "/api/v1/announcements/\(id)/reactions/\(name)", method: .DELETE(.EMPTY))
    }
}
