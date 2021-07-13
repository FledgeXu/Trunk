//
//  RelationshipTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class RelationshipTests: XCTestCase {
    let testJosn = """
        {
           "id":"1",
           "following":false,
           "showing_reblogs":false,
           "notifying":false,
           "followed_by":false,
           "blocking":false,
           "blocked_by":false,
           "muting":false,
           "muting_notifications":false,
           "requested":false,
           "domain_blocking":false,
           "endorsed":false,
           "note":""
        }
        """
    let type = Relationship.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertFalse(result.blocking)
    }
}
