//
//  InstanceEndpoint.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum InstanceEndpoint {
    
    /// Information about the server.
    /// Endpoint: `/api/v1/instance`
    /// - Returns: <#description#>
    public static func featchInstance() -> Request<Instance> {
        return Request(path: "/api/v1/instance")
    }
    
    /// Domains that this instance is aware of.
    /// Endpoint: `/api/v1/instance/peers`
    /// - Returns: Array of String
    public static func listOfConnectedDomains() -> Request<[String]> {
        return Request(path: "/api/v1/instance/peers")
    }
    
    /// Instance activity over the last 3 months, binned weekly.
    /// Endpoint: `/api/v1/instance/activity`
    /// - Returns: Array of Activity
    public static func weeklyActivity() -> Request<[Activity]> {
        return Request(path: "/api/v1/instance/activity")
    }
}
