//
//  NotificationTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
@testable import Trunk

final class NotificationTests: XCTestCase {
    let testJosn = """
        {
           "id":"1463664",
           "type":"mention",
           "created_at":"2021-07-06T02:41:39.184Z",
           "account":{
              "id":"6256",
              "username":"dollars0427",
              "acct":"dollars0427@mastodon.sardo.work",
              "display_name":"Mr.Twister",
              "locked":false,
              "bot":false,
              "discoverable":false,
              "group":false,
              "created_at":"2018-03-21T00:00:00.000Z",
              "note":"友好主義，隨時歡迎Follow，一般只要是活躍用戶都會回Follow的。",
              "url":"https://mastodon.sardo.work/@dollars0427",
              "avatar":"https://files.mastodon.online/cache/accounts/avatars/000/006/256/original/663907498a8126c9.jpg",
              "avatar_static":"https://files.mastodon.online/cache/accounts/avatars/000/006/256/original/663907498a8126c9.jpg",
              "header":"https://files.mastodon.online/cache/accounts/headers/000/006/256/original/22246c345f4e3b31.jpg",
              "header_static":"https://files.mastodon.online/cache/accounts/headers/000/006/256/original/22246c345f4e3b31.jpg",
              "followers_count":214,
              "following_count":78,
              "statuses_count":4833,
              "last_status_at":"2021-07-11",
              "emojis":[
                 
              ],
              "fields":[
                 {
                    "name":"趣味",
                    "value":"プログラミング，ゲーム",
                    "verified_at":null
                 },
                 {
                    "name":"職業",
                    "value":"Front-End Developer",
                    "verified_at":null
                 },
                 {
                    "name":"語言",
                    "value":"繁體中文，日本語，English",
                    "verified_at":null
                 },
                 {
                    "name":"ゲーム",
                    "value":"FFXIV",
                    "verified_at":null
                 }
              ]
           },
           "status":{
              "id":"106531343509798588",
              "created_at":"2021-07-06T02:41:38.000Z",
              "in_reply_to_id":"106530931116416032",
              "in_reply_to_account_id":"24835",
              "sensitive":false,
              "spoiler_text":"",
              "visibility":"public",
              "language":"zh",
              "uri":"https://mastodon.sardo.work/users/dollars0427/statuses/106531343434845013",
              "url":"https://mastodon.sardo.work/@dollars0427/106531343434845013",
              "replies_count":1,
              "reblogs_count":0,
              "favourites_count":0,
              "favourited":false,
              "reblogged":false,
              "muted":false,
              "bookmarked":false,
              "content":"這點是真的，基本上Manjaro可以立即使用完全不用調較外觀，不過不知為何我之前試用的時侯中文字之間都會莫明地有空格，不知道是不是字型的問題",
              "reblog":null,
              "account":{
                 "id":"6256",
                 "username":"dollars0427",
                 "acct":"dollars0427@mastodon.sardo.work",
                 "display_name":"Mr.Twister",
                 "locked":false,
                 "bot":false,
                 "discoverable":false,
                 "group":false,
                 "created_at":"2018-03-21T00:00:00.000Z",
                 "note":"<p>沙度，沉迷月亮計劃遊戲的Front End Developer。<br>友好主義，隨時歡迎Follow，一般只要是活躍用戶都會回Follow的。<br>日本語もOKです。</p><p>改變飲料，調制人生。</p>",
                 "url":"https://mastodon.sardo.work/@dollars0427",
                 "avatar":"https://files.mastodon.online/cache/accounts/avatars/000/006/256/original/663907498a8126c9.jpg",
                 "avatar_static":"https://files.mastodon.online/cache/accounts/avatars/000/006/256/original/663907498a8126c9.jpg",
                 "header":"https://files.mastodon.online/cache/accounts/headers/000/006/256/original/22246c345f4e3b31.jpg",
                 "header_static":"https://files.mastodon.online/cache/accounts/headers/000/006/256/original/22246c345f4e3b31.jpg",
                 "followers_count":214,
                 "following_count":78,
                 "statuses_count":4833,
                 "last_status_at":"2021-07-11",
                 "emojis":[
                    
                 ],
                 "fields":[
                    {
                       "name":"趣味",
                       "value":"プログラミング，ゲーム",
                       "verified_at":null
                    },
                    {
                       "name":"職業",
                       "value":"Front-End Developer",
                       "verified_at":null
                    },
                    {
                       "name":"語言",
                       "value":"繁體中文，日本語，English",
                       "verified_at":null
                    },
                    {
                       "name":"ゲーム",
                       "value":"FFXIV",
                       "verified_at":null
                    }
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
    let type = Notification.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.id, "1463664")
    }
}
