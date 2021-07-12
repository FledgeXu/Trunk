//
//  StatusTest.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class StatusTest: XCTestCase {
    let testJosn = """
        {
           "id":"106568469974934592",
           "created_at":"2021-07-12T16:03:18.000Z",
           "in_reply_to_id":null,
           "in_reply_to_account_id":null,
           "sensitive":false,
           "spoiler_text":"",
           "visibility":"public",
           "language":"fr",
           "uri":"https://mamot.fr/users/T_Bouhafs/statuses/106568469592251592",
           "url":"https://mamot.fr/@T_Bouhafs/106568469592251592",
           "replies_count":0,
           "reblogs_count":0,
           "favourites_count":0,
           "content":"festival d’Avignon avec",
           "reblog":null,
           "account":{
              "id":"201538",
              "username":"T_Bouhafs",
              "acct":"T_Bouhafs@mamot.fr",
              "display_name":"Taha Bouhafs 🔻",
              "locked":false,
              "bot":true,
              "discoverable":false,
              "group":false,
              "created_at":"2021-03-13T00:00:00.000Z",
              "note":"je couvre les conflits sociaux. | Vous pouvez me suivre sur Twitch: twitch.tv/taha_bouhafs",
              "url":"https://mamot.fr/@T_Bouhafs",
              "avatar":"https://files.mastodon.online/cache/accounts/avatars/000/201/538/original/04a90330378650e8.jpg",
              "avatar_static":"https://files.mastodon.online/cache/accounts/avatars/000/201/538/original/04a90330378650e8.jpg",
              "header":"https://files.mastodon.online/cache/accounts/headers/000/201/538/original/1507c458387d1365.jpeg",
              "header_static":"https://files.mastodon.online/cache/accounts/headers/000/201/538/original/1507c458387d1365.jpeg",
              "followers_count":121,
              "following_count":1,
              "statuses_count":1495,
              "last_status_at":"2021-07-12",
              "emojis":[
                 
              ],
              "fields":[
                 {
                    "name":"Twitch",
                    "value":"https://twitch.tv/taha_bouhafs",
                    "verified_at":null
                 }
              ]
           },
           "media_attachments":[
              {
                 "id":"106568090139741956",
                 "type":"unknown",
                 "url":"https://mastodon.online/media_proxy/106568090139741956/original",
                 "preview_url":"https://mastodon.online/media_proxy/106568090139741956/small",
                 "remote_url":"https://files.botsin.space/media_attachments/files/106/568/089/839/851/055/original/f5402a6899a413a1.png",
                 "preview_remote_url":null,
                 "text_url":null,
                 "meta":null,
                 "description":null,
                 "blurhash":"ULT8?,jZy?ogs9aKW;kpuOayU^kCtRo}aeVZ"
              }
           ],
           "mentions":[
              {
                 "id":"13487",
                 "username":"davduf",
                 "url":"https://mamot.fr/@davduf",
                 "acct":"davduf@mamot.fr"
              }
           ],
           "tags":[
              {
                 "name":"公交上抓小偷的警校生被记三等功",
                 "url":"https://mastodon.online/tags/%E5%85%AC%E4%BA%A4%E4%B8%8A%E6%8A%93%E5%B0%8F%E5%81%B7%E7%9A%84%E8%AD%A6%E6%A0%A1%E7%94%9F%E8%A2%AB%E8%AE%B0%E4%B8%89%E7%AD%89%E5%8A%9F"
              }
           ],
           "emojis":[
              {
                 "shortcode":"sys_link",
                 "url":"https://files.mastodon.online/cache/custom_emojis/images/000/032/419/original/86437897ea01940d.png",
                 "static_url":"https://files.mastodon.online/cache/custom_emojis/images/000/032/419/static/86437897ea01940d.png",
                 "visible_in_picker":true
              }
           ],
           "card":null,
           "poll":null
        }
        """
    let type = Status.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.id, "106568469974934592")
    }
}
