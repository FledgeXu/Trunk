//
//  ScheduledStatusTests.swift
//  
//
//  Created by Fledge Shiu on 2021/7/16.
//

import XCTest
import Foundation
@testable import Trunk

final class ScheduledStatusTests: XCTestCase {
    let testJosn1 = """
        {
           "id":"2302",
           "scheduled_at":"2021-07-16T13:00:32.000Z",
           "params":{
              "text":"Test Status",
              "media_ids":[
                 "106590348091961024"
              ],
              "sensitive":null,
              "spoiler_text":null,
              "visibility":null,
              "scheduled_at":null,
              "poll":null,
              "idempotency":null,
              "with_rate_limit":false,
              "in_reply_to_id":null,
              "application_id":34311
           },
           "media_attachments":[
              {
                 "id":"106590348091961024",
                 "type":"image",
                 "url":"https://files.mastodon.online/media_attachments/files/106/590/348/091/961/024/original/42dc6d0fb8ddaab0.jpeg",
                 "preview_url":"https://files.mastodon.online/media_attachments/files/106/590/348/091/961/024/small/42dc6d0fb8ddaab0.jpeg",
                 "remote_url":null,
                 "preview_remote_url":null,
                 "text_url":"https://mastodon.online/media/4aMIZ0MQ7vC5a-uqTEs",
                 "meta":{
                    "original":{
                       "width":259,
                       "height":194,
                       "size":"259x194",
                       "aspect":1.3350515463917525
                    },
                    "small":{
                       "width":259,
                       "height":194,
                       "size":"259x194",
                       "aspect":1.3350515463917525
                    }
                 },
                 "description":null,
                 "blurhash":"UWKwgt=X0Kn-?aOU9bV^a1k9-:o2t1j[M}j]"
              }
           ]
        }
        """
    
    let testJosn2 = """
        {
           "id":"2306",
           "scheduled_at":"2021-07-16T13:00:32.000Z",
           "params":{
              "text":"Test Status",
              "media_ids":null,
              "sensitive":null,
              "spoiler_text":null,
              "visibility":null,
              "scheduled_at":null,
              "poll":{
                 "multiple":"ture",
                 "hide_totals":"ture",
                 "expires_in":"3600",
                 "options":[
                    "poll1",
                    "poll2"
                 ]
              },
              "idempotency":null,
              "with_rate_limit":false,
              "in_reply_to_id":null,
              "application_id":34311
           },
           "media_attachments":[
              
           ]
        }
        """
    
    let type = ScheduledStatus.self
    func testExample() {
        // results.
        let jsonData1 = testJosn1.data(using: .utf8)!
        let result1 = try! JSONDecoder().decode(type, from: jsonData1)
        let jsonData2 = testJosn2.data(using: .utf8)!
        let result2 = try! JSONDecoder().decode(type, from: jsonData2)
        // Asserts
        XCTAssertEqual(result1.id, "2302")
        XCTAssertEqual(result2.id, "2306")
    }
}
