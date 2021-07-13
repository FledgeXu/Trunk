//
//  FeaturedTagTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class FeaturedTagTests: XCTestCase {
    let testJosn = """
        {
           "id":"627",
           "name":"nowplaying",
           "statuses_count":36,
           "last_status_at":"2019-11-15T07:14:43.524Z"
        }
        """
    let type = FeaturedTag.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.id, "627")
    }
}
