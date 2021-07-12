//
//  AnnouncementReactionTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AnnouncementReactionTests: XCTestCase {
    let testJosn = """
        {
           "name":"bongoCat",
           "count":9,
           "me":false,
           "url":"https://files.mastodon.social/custom_emojis/images/000/067/715/original/fdba57dff7576d53.png",
           "static_url":"https://files.mastodon.social/custom_emojis/images/000/067/715/static/fdba57dff7576d53.png"
        }
        """
    let type = AnnouncementReaction.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.name, "bongoCat")
    }
}
