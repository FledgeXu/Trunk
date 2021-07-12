//
//  AttachmentVideoMetaTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AttachmentVideoMetaTests: XCTestCase {
    let testJosn = """
        {
           "length":"0:01:28.65",
           "duration":88.65,
           "fps":24,
           "size":"1280x720",
           "width":1280,
           "height":720,
           "aspect":1.7777777777777777,
           "audio_encode":"aac (LC) (mp4a / 0x6134706D)",
           "audio_bitrate":"44100 Hz",
           "audio_channels":"stereo",
           "original":{
              "width":1280,
              "height":720,
              "frame_rate":"6159375/249269",
              "duration":88.654,
              "bitrate":862056
           },
           "small":{
              "width":400,
              "height":225,
              "size":"400x225",
              "aspect":1.7777777777777777
           }
        }
        """
    let type = AttachmentVideoMeta.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.audioEncode, "aac (LC) (mp4a / 0x6134706D)")
        XCTAssertEqual(result.original.frameRate, "6159375/249269")
    }
}
