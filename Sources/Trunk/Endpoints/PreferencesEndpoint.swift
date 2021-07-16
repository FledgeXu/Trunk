//
//  PreferencesEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import Foundation

public enum PreferencesEndpoint {
    public static func getPreferences() -> Request<Preferences> {
        return Request(path: "/api/v1/preferences", method: .GET(.EMPTY))
    }
}
