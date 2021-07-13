//
//  PushSubscriptionTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class PushSubscriptionTests: XCTestCase {
    let testJosn = """
        {
           "id":328183,
           "endpoint":"https://yourdomain.example/listener",
           "alerts":{
              "follow":true,
              "favourite":true,
              "reblog":true,
              "mention":true,
              "poll":true
           },
           "server_key":"BCk-QqERU0q-CfYZjcuB6lnyyOYfJ2AifKqfeGIm7Z-HiTU5T9eTG5GxVA0_OH5mMlI4UkkDTpaZwozy0TzdZ2M="
        }
        """
    let type = PushSubscription.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.id, 328183)
    }
}
