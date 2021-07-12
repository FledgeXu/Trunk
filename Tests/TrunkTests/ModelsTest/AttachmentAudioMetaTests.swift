//
//  AttachmentAudioMetaTests.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AttachmentAudioMetaTests: XCTestCase {
    let testJosn = """
        {
           "length":"0:06:42.86",
           "duration":402.86,
           "audio_encode":"mp3",
           "audio_bitrate":"44100 Hz",
           "audio_channels":"stereo",
           "original":{
              "duration":402.860408,
              "bitrate":166290
           }
        }
        """
    let type = AttachmentAudioMeta.self
    func testExample() {
        // results.
        let jsonData = testJosn.data(using: .utf8)!
        let result = try! JSONDecoder().decode(type, from: jsonData)
        // Asserts
        XCTAssertEqual(result.original.bitrate, 166290)
    }
}
