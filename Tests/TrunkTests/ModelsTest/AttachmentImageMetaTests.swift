//
//  AttachmentImageMeta.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AttachmentImageMetaTests: XCTestCase {
    let testJosn = """
        {
           "original":{
              "width":640,
              "height":480,
              "size":"640x480",
              "aspect":1.3333333333333333
           },
           "small":{
              "width":461,
              "height":346,
              "size":"461x346",
              "aspect":1.3323699421965318
           },
           "focus":{
              "x":-0.27,
              "y":0.51
           }
        }
        """
    let type = AttachmentImageMeta.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.original?.size, "640x480")
        XCTAssertEqual(result.small?.aspect, 1.3323699421965318)
        XCTAssertEqual(result.focus?.y, 0.51)
    }
}
