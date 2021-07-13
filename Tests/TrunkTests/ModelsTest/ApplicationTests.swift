//
//  ApplicationTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class ApplicationTests: XCTestCase {
    let testJosn = """
        {
           "id":"34214",
           "name":"Test",
           "website":"https://www.testurl.com",
           "redirect_uri":"urn:ietf:wg:oauth:2.0:oob",
           "client_id":"9kGYSMD5bxxxxxxxxxxxxxxxxxxxxx",
           "client_secret":"QmJm0A-9kGYSMD5bxxxxxxxxxxxxxxxxxxxxx",
           "vapid_key":"BIqC7gExWl9KYi9D89xF2SaYYmEA0Bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        }
    """
    let type = Application.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.name, "Test")
    }
}
