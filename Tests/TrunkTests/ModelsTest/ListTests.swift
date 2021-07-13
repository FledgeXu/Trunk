//
//  ListTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class ListTests: XCTestCase {
    let testJosn = """
        {
           "id":"1343",
           "title":"Test",
           "replies_policy":"list"
        }
        """
    let type = List.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.id, "1343")
    }
}
