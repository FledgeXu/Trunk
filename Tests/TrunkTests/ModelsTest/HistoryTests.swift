//
//  HistoryTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class HistoryTests: XCTestCase {
    let testJosn = """
        {
           "day":"1574553600",
           "uses":"200",
           "accounts":"31"
        }
        """
    let type = History.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.uses, "200")
    }
}
