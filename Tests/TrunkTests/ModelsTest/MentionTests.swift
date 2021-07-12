//
//  MentionTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class MentionTests: XCTestCase {
    let testJosn = """
        {
           "id":"13487",
           "username":"davduf",
           "url":"https://mamot.fr/@davduf",
           "acct":"davduf@mamot.fr"
        }
        """
    let type = Mention.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.url.absoluteString, "https://mamot.fr/@davduf")
    }
}
