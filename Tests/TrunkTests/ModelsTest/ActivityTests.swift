//
//  ActivityTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class ActivityTests: XCTestCase {
    let testJosn = """
        {
           "week":"1626040800",
           "statuses":"370",
           "logins":"333",
           "registrations":"13"
        }
        """
    let type = Activity.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.week, "1626040800")
    }
}
