//
//  InstanceTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class InstanceTests: XCTestCase {
    let testJosn = """
        {
           "uri":"mastodon.online",
           "title":"Mastodon",
           "short_description":"This is a brand new server run by the main developers of the project as a spin-off of mastodon.social",
           "description":"",
           "email":"staff@mastodon.online",
           "version":"3.4.1",
           "urls":{
              "streaming_api":"wss://mastodon.online"
           },
           "stats":{
              "user_count":51899,
              "status_count":863143,
              "domain_count":8084
           },
           "thumbnail":"https://files.mastodon.online/site_uploads/files/000/000/001/original/rio2.png",
           "languages":[
              "en"
           ],
           "registrations":true,
           "approval_required":false,
           "invites_enabled":true,
           "contact_account":{
              "id":"1",
              "username":"Gargron",
              "acct":"Gargron",
              "display_name":"Eugen (Personal)",
              "locked":true,
              "bot":false,
              "discoverable":false,
              "group":false,
              "created_at":"2020-05-30T00:00:00.000Z",
              "note":"Developer of Mastodon and administrator of mastodon.social and mastodon.online. This is a personal account. Direct any business inquiries to",
              "url":"https://mastodon.online/@Gargron",
              "avatar":"https://files.mastodon.online/accounts/avatars/000/000/001/original/adef89f7c44d0498.png",
              "avatar_static":"https://files.mastodon.online/accounts/avatars/000/000/001/original/adef89f7c44d0498.png",
              "header":"https://files.mastodon.online/accounts/headers/000/000/001/original/257299c995e6146c.jpg",
              "header_static":"https://files.mastodon.online/accounts/headers/000/000/001/original/257299c995e6146c.jpg",
              "followers_count":59,
              "following_count":33,
              "statuses_count":355,
              "last_status_at":"2021-07-12",
              "emojis":[
                 
              ],
              "fields":[
                 
              ]
           },
           "rules":[
              {
                 "id":"5",
                 "text":"No cross-posting from Twitter "
              },
              {
                 "id":"6",
                 "text":"Sexually explicit or violent media must be marked as sensitive when posting"
              },
              {
                 "id":"3",
                 "text":"No spam, advertising or bot accounts"
              },
              {
                 "id":"1",
                 "text":"No racism, sexism, homophobia, transphobia, xenophobia, or casteism"
              },
              {
                 "id":"7",
                 "text":"No incitement of violence or promotion of violent ideologies"
              },
              {
                 "id":"8",
                 "text":"No harassment, dogpiling or doxxing of other users"
              },
              {
                 "id":"9",
                 "text":"No content illegal in Germany"
              }
           ]
        }
        """
    let type = Instance.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.title, "Mastodon")
    }
}
