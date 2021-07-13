//
//  MarkerTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class MarkerTests: XCTestCase {
    let testJosn = """
        {
           "home":{
              "last_read_id":"106569517320722107",
              "version":338,
              "updated_at":"2021-07-13T00:31:49.955Z"
           },
           "notifications":{
              "last_read_id":"1463664",
              "version":7,
              "updated_at":"2021-07-08T10:31:15.249Z"
           }
        }
        """
    let type = Marker.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.home?.version, 338)
    }
}
