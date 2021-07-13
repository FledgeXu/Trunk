//
//  ResultsTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class ResultsTests: XCTestCase {
    let testJosn = """
        {
            "accounts": [
                {
                    "id": "160640",
                    "username": "nsfw",
                    "acct": "nsfw@zhub.link",
                    "display_name": "NSFW",
                    "locked": false,
                    "bot": true,
                    "discoverable": true,
                    "group": false,
                    "created_at": "2021-01-12T00:00:00.000Z",
                    "note": "<p>NSFW pictures bot.</p>",
                    "url": "https://zhub.link/@nsfw",
                    "avatar": "https://files.mastodon.online/cache/accounts/avatars/000/160/640/original/77fa823be8c0a3be.jpg",
                    "avatar_static": "https://files.mastodon.online/cache/accounts/avatars/000/160/640/original/77fa823be8c0a3be.jpg",
                    "header": "https://mastodon.online/headers/original/missing.png",
                    "header_static": "https://mastodon.online/headers/original/missing.png",
                    "followers_count": 347,
                    "following_count": 6,
                    "statuses_count": 2794,
                    "last_status_at": null,
                    "emojis": [],
                    "fields": []
                }
            ],
            "statuses": [],
            "hashtags": [
                {
                    "name": "nsfwish",
                    "url": "https://mastodon.online/tags/nsfwish",
                    "history": [
                        {
                            "day": "1626134400",
                            "uses": "0",
                            "accounts": "0"
                        },
                        {
                            "day": "1626048000",
                            "uses": "0",
                            "accounts": "0"
                        },
                        {
                            "day": "1625961600",
                            "uses": "0",
                            "accounts": "0"
                        },
                        {
                            "day": "1625875200",
                            "uses": "0",
                            "accounts": "0"
                        },
                        {
                            "day": "1625788800",
                            "uses": "0",
                            "accounts": "0"
                        },
                        {
                            "day": "1625702400",
                            "uses": "0",
                            "accounts": "0"
                        },
                        {
                            "day": "1625616000",
                            "uses": "0",
                            "accounts": "0"
                        }
                    ]
                }
            ]
        }
        """
    let type = Results.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.accounts.count, 1)
    }
}
