//
//  FilterTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class FilterTests: XCTestCase {
    let testJosn = """
        {
           "id":"1343",
           "phrase":"TestFilter",
           "context":[
              "home",
              "notifications",
              "public",
              "thread",
              "account"
           ],
           "whole_word":true,
           "expires_at":null,
           "irreversible":true
        }
        """
    let type = Filter.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.id, "1343")
    }
}
