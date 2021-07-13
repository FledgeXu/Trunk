//
//  ConversationTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class ConversationTests: XCTestCase {
    let testJosn = """
        {
           "id":"22689",
           "unread":false,
           "accounts":[
              {
                 "id":"215667",
                 "username":"Ritamastodon",
                 "acct":"Ritamastodon",
                 "display_name":"Rita",
                 "locked":true,
                 "bot":false,
                 "discoverable":false,
                 "group":false,
                 "created_at":"2021-04-12T00:00:00.000Z",
                 "note":"<p>每一个中国女性都有义务感谢计划生育。<br />女权不包括繁殖权。<br />穷人无权生育。<br />女权高于人权。<br />生育对社会没有贡献。<br />百合消费女色，充满厌女底色。看百合都是精神男人。</p>",
                 "url":"https://mastodon.online/@Ritamastodon",
                 "avatar":"https://files.mastodon.online/accounts/avatars/000/215/667/original/a514ac03731c23e3.jpeg",
                 "avatar_static":"https://files.mastodon.online/accounts/avatars/000/215/667/original/a514ac03731c23e3.jpeg",
                 "header":"https://files.mastodon.online/accounts/headers/000/215/667/original/dfe03ff6836b1425.jpg",
                 "header_static":"https://files.mastodon.online/accounts/headers/000/215/667/original/dfe03ff6836b1425.jpg",
                 "followers_count":0,
                 "following_count":21,
                 "statuses_count":281,
                 "last_status_at":"2021-07-12",
                 "emojis":[
                    
                 ],
                 "fields":[
                    
                 ]
              }
           ],
           "last_status":{
              "id":"106056721729470491",
              "created_at":"2021-04-13T06:59:05.550Z",
              "in_reply_to_id":"106056707845481145",
              "in_reply_to_account_id":"24835",
              "sensitive":false,
              "spoiler_text":"",
              "visibility":"direct",
              "language":"zh",
              "uri":"https://mastodon.online/users/Ritamastodon/statuses/106056721729470491",
              "url":"https://mastodon.online/@Ritamastodon/106056721729470491",
              "replies_count":0,
              "reblogs_count":0,
              "favourites_count":0,
              "favourited":false,
              "reblogged":false,
              "muted":false,
              "bookmarked":false,
              "content":"主要是大反贼不来这里，因为去中心没有流量。所以气氛搞不起来。</p>",
              "reblog":null,
              "account":{
                 "id":"215667",
                 "username":"Ritamastodon",
                 "acct":"Ritamastodon",
                 "display_name":"Rita",
                 "locked":true,
                 "bot":false,
                 "discoverable":false,
                 "group":false,
                 "created_at":"2021-04-12T00:00:00.000Z",
                 "note":"<p>每一个中国女性都有义务感谢计划生育。<br />女权不包括繁殖权。<br />穷人无权生育。<br />女权高于人权。<br />生育对社会没有贡献。<br />百合消费女色，充满厌女底色。看百合都是精神男人。</p>",
                 "url":"https://mastodon.online/@Ritamastodon",
                 "avatar":"https://files.mastodon.online/accounts/avatars/000/215/667/original/a514ac03731c23e3.jpeg",
                 "avatar_static":"https://files.mastodon.online/accounts/avatars/000/215/667/original/a514ac03731c23e3.jpeg",
                 "header":"https://files.mastodon.online/accounts/headers/000/215/667/original/dfe03ff6836b1425.jpg",
                 "header_static":"https://files.mastodon.online/accounts/headers/000/215/667/original/dfe03ff6836b1425.jpg",
                 "followers_count":0,
                 "following_count":21,
                 "statuses_count":281,
                 "last_status_at":"2021-07-12",
                 "emojis":[
                    
                 ],
                 "fields":[
                    
                 ]
              },
              "media_attachments":[
                 
              ],
              "mentions":[
                 {
                    "id":"24835",
                    "username":"FledgeXu",
                    "url":"https://mastodon.online/@FledgeXu",
                    "acct":"FledgeXu"
                 }
              ],
              "tags":[
                 
              ],
              "emojis":[
                 
              ],
              "card":null,
              "poll":null
           }
        }
        """
    let type = Conversation.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertFalse(result.unread)
    }
}
