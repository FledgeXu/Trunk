//
//  EmojiTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class EmojiTests: XCTestCase {
    let testJosn = """
        {
           "shortcode":"sys_link",
           "url":"https://files.mastodon.online/cache/custom_emojis/images/000/032/419/original/86437897ea01940d.png",
           "static_url":"https://files.mastodon.online/cache/custom_emojis/images/000/032/419/static/86437897ea01940d.png",
           "visible_in_picker":true
        }
        """
    let type = Emoji.self
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.shortcode, "sys_link")
        XCTAssertEqual(result.url.absoluteString, "https://files.mastodon.online/cache/custom_emojis/images/000/032/419/original/86437897ea01940d.png")
        XCTAssertEqual(result.staticURL.absoluteString, "https://files.mastodon.online/cache/custom_emojis/images/000/032/419/static/86437897ea01940d.png")
        XCTAssertTrue(result.visibleInPicker)
    }
}
