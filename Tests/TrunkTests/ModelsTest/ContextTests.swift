//
//  ContextTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class ContextTests: XCTestCase {
    let testJosn = """
        {
           "ancestors":[
              {
                 "id":"106056707845481145",
                 "created_at":"2021-04-13T06:55:33.689Z",
                 "in_reply_to_id":null,
                 "in_reply_to_account_id":null,
                 "sensitive":false,
                 "spoiler_text":"",
                 "visibility":"public",
                 "language":"zh",
                 "uri":"https://mastodon.online/users/FledgeXu/statuses/106056707845481145",
                 "url":"https://mastodon.online/@FledgeXu/106056707845481145",
                 "replies_count":0,
                 "reblogs_count":0,
                 "favourites_count":0,
                 "favourited":false,
                 "reblogged":false,
                 "muted":false,
                 "bookmarked":false,
                 "pinned":false,
                 "content":"推特是个可以大大方方说自己是反贼而不会有什么问题的地方。Mastodon上还没有这种感觉。",
                 "reblog":null,
                 "application":{
                    "name":"Mast",
                    "website":"https://twitter.com/jpeguin"
                 },
                 "account":{
                    "id":"24835",
                    "username":"FledgeXu",
                    "acct":"FledgeXu",
                    "display_name":"FlegdeShiu",
                    "locked":false,
                    "bot":false,
                    "discoverable":false,
                    "group":false,
                    "created_at":"2020-06-13T00:00:00.000Z",
                    "note":"人类还是早点灭亡了的好。",
                    "url":"https://mastodon.online/@FledgeXu",
                    "avatar":"https://files.mastodon.online/accounts/avatars/000/024/835/original/e27a35cfb1674a04.jpeg",
                    "avatar_static":"https://files.mastodon.online/accounts/avatars/000/024/835/original/e27a35cfb1674a04.jpeg",
                    "header":"https://mastodon.online/headers/original/missing.png",
                    "header_static":"https://mastodon.online/headers/original/missing.png",
                    "followers_count":6,
                    "following_count":12,
                    "statuses_count":32,
                    "last_status_at":"2021-07-07",
                    "emojis":[
                       
                    ],
                    "fields":[
                       
                    ]
                 },
                 "media_attachments":[
                    
                 ],
                 "mentions":[
                    
                 ],
                 "tags":[
                    
                 ],
                 "emojis":[
                    
                 ],
                 "card":null,
                 "poll":null
              }
           ],
           "descendants":[
              
           ]
        }
        """
    let type = Context.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertNotEqual(result.ancestors.count, 0)
        XCTAssertEqual(result.descendants.count, 0)
    }
}
