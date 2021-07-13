//
//  IdentityProofTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class IdentityProofTests: XCTestCase {
    let testJosn = """
        {
           "provider":"Keybase",
           "provider_username":"gargron",
           "updated_at":"2019-07-21T20:14:39.596Z",
           "proof_url":"https://keybase.io/gargron/sigchain#5cfc20c7018f2beefb42a68836da59a792e55daa4d118498c9b1898de7e845690f",
           "profile_url":"https://keybase.io/gargron"
        }
        """
    let type = IdentityProof.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.provider, "Keybase")
    }
}
