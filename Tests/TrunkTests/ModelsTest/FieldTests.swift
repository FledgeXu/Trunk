//
//  FieldTests.swift
//  
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class FieldTests: XCTestCase {
    let testJosn = """
        {
           "name":"Current Stack",
           "value":"Bamboo, Katalon, npm, Plenti, Sapper, Software Testing, SvelteKit",
           "verified_at":null
        }
        """
    let type = Field.self
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.name, "Current Stack")
        XCTAssertEqual(result.value, "Bamboo, Katalon, npm, Plenti, Sapper, Software Testing, SvelteKit")
        XCTAssertNil(result.verifiedAt)
    }
}
