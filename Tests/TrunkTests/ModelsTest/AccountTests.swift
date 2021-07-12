//
//  AccountTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AccountTests: XCTestCase {
    let testJosn = """
        {
           "id":"201538",
           "username":"T_Bouhafs",
           "acct":"T_Bouhafs@mamot.fr",
           "display_name":"Taha Bouhafs 🔻",
           "locked":false,
           "bot":true,
           "discoverable":false,
           "group":false,
           "created_at":"2021-03-13T00:00:00.000Z",
           "note":"Vous pouvez me suivre sur Twitch: twitch.tv/taha_bouhafs",
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
                 "value":"https://twitch.tv/taha_bouhafe",
                 "verified_at":null
              }
           ]
        }
        """
    let type = Account.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.username, "T_Bouhafs")
        XCTAssertEqual(result.fields?[0].name, "Twitch")
    }
}
