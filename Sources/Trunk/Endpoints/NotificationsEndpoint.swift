//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum NotificationsEndpoint {
    public static func getAllNotifications(accountId: String? = nil,
                                           excludeTypes: [NotificationType]? = nil,
                                           limit: Int? = nil,
                                           maxId: String? = nil,
                                           sinceId: String? = nil,
                                           minId: String? = nil) -> Request<[Notification]> {
        let toLimitBounds = between(1, and: 40, default: 20)
        var parameters = [
            Parameter(key: "account_id", value: accountId),
            Parameter(key: "limit", value: limit.map(toLimitBounds).flatMap(toOptionalString)),
            Parameter(key: "max_id", value: maxId),
            Parameter(key: "since_id", value: sinceId),
            Parameter(key: "min_id", value: minId),
        ]
        excludeTypes?.forEach({ notificationType in
            parameters.append(Parameter(key: "exclude_types[]", value: notificationType.rawValue))
        })
        return Request(path: "/api/v1/notifications", method: .GET(.PARAMETERS(parameters)))
    }}
