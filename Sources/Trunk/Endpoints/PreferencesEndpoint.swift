//
//  PreferencesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum PreferencesEndpoint {
    
    /// Preferences defined by the user in their account settings.
    /// Endpoint: `/api/v1/preferences`
    /// - Returns: Preferences by key and value
    public static func viewUserPreferences() -> Request<Preferences> {
        return Request(path: "/api/v1/preferences", method: .GET(.EMPTY))
    }
}
