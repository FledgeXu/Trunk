//
//  AttachmentGIFVMetaTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AttachmentGIFVMetaTests: XCTestCase {
    let testJosn = """
        {
           "length":"0:00:01.11",
           "duration":1.11,
           "fps":33,
           "size":"600x332",
           "width":600,
           "height":332,
           "aspect":1.8072289156626506,
           "original":{
              "width":600,
              "height":332,
              "frame_rate":"100/3",
              "duration":1.11,
              "bitrate":1627639
           },
           "small":{
              "width":400,
              "height":221,
              "size":"400x221",
              "aspect":1.8099547511312217
           }
        }
        """
    let type = AttachmentGIFVMeta.self
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.size, "600x332")
        XCTAssertEqual(result.original.frameRate, "100/3")
    }
}
