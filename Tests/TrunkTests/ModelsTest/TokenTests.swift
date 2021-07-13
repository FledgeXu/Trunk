//
//  TokenTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
@testable import Trunk

final class TokenTests: XCTestCase {
    let testJosn = """
        {
           "access_token":"ZA-Yj3aBD8U8Cm7lKUp-lm9O9BmDgdhHzDeqsY8tlL0",
           "token_type":"Bearer",
           "scope":"read write follow push",
           "created_at":1573979017
        }
        """
    let type = Token.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.accessToken, "ZA-Yj3aBD8U8Cm7lKUp-lm9O9BmDgdhHzDeqsY8tlL0")
        XCTAssertNotEqual(result.scope.count, 0)
    }
}
