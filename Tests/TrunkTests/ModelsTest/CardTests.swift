//
//  CardTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class CardTests: XCTestCase {
    let testJosn = """
        {
           "url":"https://videos.trom.tf/videos/watch/e3a55baa-ffb3-4c4d-8c69-de1a02226b23",
           "title":"Crisis Change: This Is How We Do It.mp4",
           "description":"",
           "type":"video",
           "author_name":"How It's Grown🌱",
           "author_url":"https://videos.trom.tf/video-channels/grow_your_own_food",
           "provider_name":"PeerTube",
           "provider_url":"https://videos.trom.tf",
           "html":"Change: This Is How We Do It.mp4",
           "width":560,
           "height":315,
           "image":"https://files.mastodon.online/cache/preview_cards/images/005/835/068/original/d965b939f30c7014.jpg",
           "embed_url":"",
           "blurhash":"U96@fwWB0gj]bIWXjYoe9bt6-oIpIpj[xZoe"
        }
        """
    let type = Card.self
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.authorName, "How It's Grown🌱")
    }
}
