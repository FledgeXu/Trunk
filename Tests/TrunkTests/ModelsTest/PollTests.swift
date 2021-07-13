//
//  PollTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class PollTests: XCTestCase {
    let testJosn = """
        {
           "id":"1",
           "expires_at":"2020-05-31T23:35:53.000Z",
           "expired":true,
           "multiple":false,
           "votes_count":80,
           "voters_count":80,
           "options":[
              {
                 "title":"ぜひ利用したい",
                 "votes_count":33
              },
              {
                 "title":"特に要らない",
                 "votes_count":22
              },
              {
                 "title":"お気に入り・ブックマークだけ要る",
                 "votes_count":12
              },
              {
                 "title":"課題や影響を慎重に判断したい",
                 "votes_count":13
              }
           ],
           "emojis":[
              
           ]
        }
        """
    let type = Poll.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertTrue(result.expired)
    }
}
