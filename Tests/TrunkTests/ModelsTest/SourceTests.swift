//
//  SourceTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class SourceTests: XCTestCase {
    let testJosn = """
        {
           "privacy":"public",
           "sensitive":false,
           "language":"",
           "note":"i have approximate knowledge of many things. perpetual student.",
           "fields":[
              {
                 "name":"Website",
                 "value":"https://trwnh.com",
                 "verified_at":"2019-08-29T04:14:55.571+00:00"
              },
              {
                 "name":"Sponsor",
                 "value":"https://liberapay.com/at",
                 "verified_at":"2019-11-15T10:06:15.557+00:00"
              },
              {
                 "name":"Fan of:",
                 "value":"Punk-rock and post-hardcore (Circa Survive, letlive., La Dispute, THE FEVER 333)Manga (Yu-Gi-Oh!, One Piece, JoJo's Bizarre Adventure, Death Note, Shaman King)Platformers and RPGs (Banjo-Kazooie, Boktai, Final Fantasy Crystal Chronicles)",
                 "verified_at":null
              },
              {
                 "name":"Main topics:",
                 "value":"systemic analysis, design patterns, anticapitalism, info/tech freedom, theory and philosophy, and otherwise being a genuine and decent wholesome poster. i'm just here to hang out and talk to cool people!",
                 "verified_at":null
              }
           ],
           "follow_requests_count":0
        }
        """
    let type = Source.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.privacy, "public")
    }
}
