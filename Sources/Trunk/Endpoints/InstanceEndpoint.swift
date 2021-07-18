//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/7/18.
//

import Foundation

public enum InstanceEndpoint {
    public static func getInstance() -> Request<Instance> {
        return Request(path: "/api/v1/instance")
    }
    
    public static func getConnectedDomains() -> Request<[String]> {
        return Request(path: "/api/v1/instance/peers")
    }
}
