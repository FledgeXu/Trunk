//
//  PreferencesTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class PreferencesTests: XCTestCase {
    let testJosn = """
        {
            "posting:default:visibility": "public",
            "posting:default:sensitive": false,
            "posting:default:language": null,
            "reading:expand:media": "default",
            "reading:expand:spoilers": false
        }
        """
    let type = Preferences.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertFalse(result.readingExpandSpoilers)
    }
}
