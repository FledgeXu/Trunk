//
//  TagTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class TagTests: XCTestCase {
    let testJosn = """
        {
           "name":"公交上抓小偷的警校生被记三等功",
           "url":"https://mastodon.online/tags/%E5%85%AC%E4%BA%A4%E4%B8%8A%E6%8A%93%E5%B0%8F%E5%81%B7%E7%9A%84%E8%AD%A6%E6%A0%A1%E7%94%9F%E8%A2%AB%E8%AE%B0%E4%B8%89%E7%AD%89%E5%8A%9F"
        }
        """
    let type = Tag.self
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.name, "公交上抓小偷的警校生被记三等功")
        XCTAssertEqual(result.url, "https://mastodon.online/tags/%E5%85%AC%E4%BA%A4%E4%B8%8A%E6%8A%93%E5%B0%8F%E5%81%B7%E7%9A%84%E8%AD%A6%E6%A0%A1%E7%94%9F%E8%A2%AB%E8%AE%B0%E4%B8%89%E7%AD%89%E5%8A%9F")
        XCTAssertNil(result.history)
    }
}
