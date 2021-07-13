//
//  Payload.swift
//  
//
//  Created by Fledge Shiu on 2021/7/13.
//

import Foundation

public enum Payload<T: Encodable> {
    case parameters(T)
    case media([String: Data])
    case empy
}
