//
//  AttachmentTest.swift
//
//
//  Created by Fledge Shiu on 2021/7/12.
//

import XCTest
import Foundation
@testable import Trunk

final class AttachmentTest: XCTestCase {
    let testJosnImage = """
        {
           "id":"22348641",
           "type":"image",
           "url":"https://files.mastodon.social/media_attachments/files/022/348/641/original/e96382f26c72a29c.jpeg",
           "preview_url":"https://files.mastodon.social/media_attachments/files/022/348/641/small/e96382f26c72a29c.jpeg",
           "remote_url":null,
           "text_url":"https://mastodon.social/media/4Zj6ewxzzzDi0g8JnZQ",
           "meta":{
              "focus":{
                 "x":-0.42,
                 "y":0.69
              },
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
              }
           },
           "description":"test uploaded via api, but updated",
           "blurhash":"UFBWY:8_0Jxv4mx]t8t64.%M-:IUWGWAt6M}"
        }
        """
    let testJosnVideo = """
        {
           "id":"22546306",
           "type":"video",
           "url":"https://files.mastodon.social/media_attachments/files/022/546/306/original/dab9a597f68b9745.mp4",
           "preview_url":"https://files.mastodon.social/media_attachments/files/022/546/306/small/dab9a597f68b9745.png",
           "remote_url":null,
           "text_url":"https://mastodon.social/media/wWd1HJIBmH1MZGDfg50",
           "meta":{
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
           },
           "description":null,
           "blurhash":"U58E0g8_0M.94T?bIr00?bD%NGoM?bD%oLt7"
        }
        """
    let testJsonGifv = """
        {
           "id":"21130559",
           "type":"gifv",
           "url":"https://files.mastodon.social/media_attachments/files/021/130/559/original/bc84838f77991326.mp4",
           "preview_url":"https://files.mastodon.social/media_attachments/files/021/130/559/small/bc84838f77991326.png",
           "remote_url":null,
           "text_url":"https://mastodon.social/media/2ICiasGyjezmi7cQYM8",
           "meta":{
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
           },
           "description":null,
           "blurhash":"URHT%Jm,2a1d%MRO%LozkrNH$*n*oMn$Rjt7"
        }
        """
    let testJsonAudio = """
        {
           "id":"21165404",
           "type":"audio",
           "url":"https://files.mastodon.social/media_attachments/files/021/165/404/original/a31a4a46cd713cd2.mp3",
           "preview_url":"https://files.mastodon.social/media_attachments/files/021/165/404/small/a31a4a46cd713cd2.mp3",
           "remote_url":null,
           "text_url":"https://mastodon.social/media/5O4uILClVqBWx0NNgvo",
           "meta":{
              "length":"0:06:42.86",
              "duration":402.86,
              "audio_encode":"mp3",
              "audio_bitrate":"44100 Hz",
              "audio_channels":"stereo",
              "original":{
                 "duration":402.860408,
                 "bitrate":166290
              }
           },
           "description":null,
           "blurhash":null
        }
        """
    let testJosnUnkonw = """
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
        """
    let type = Attachment.self
    
    func testExample() {
        // results.
        let testJosnImage = testJosnImage.data(using: .utf8)!
        let resultImage = try! JSONDecoder().decode(type, from: testJosnImage)
        
        let testJosnVideo = testJosnVideo.data(using: .utf8)!
        let resultVideo = try! JSONDecoder().decode(type, from: testJosnVideo)
        
        let testJsonGifv = testJsonGifv.data(using: .utf8)!
        let resultGifv = try! JSONDecoder().decode(type, from: testJsonGifv)
        
        let testJsonAudio = testJsonAudio.data(using: .utf8)!
        let resultAudio = try! JSONDecoder().decode(type, from: testJsonAudio)
        
        let testJosnUnkonw = testJosnUnkonw.data(using: .utf8)!
        let resultUnkow = try! JSONDecoder().decode(type, from: testJosnUnkonw)
        // Asserts
        XCTAssertEqual(resultImage.id, "22348641")
        switch resultImage.meta {
        case .image(let meta):
            XCTAssertEqual(meta.small?.size, "461x346")
        default:
            XCTFail()
        }
        
        XCTAssertEqual(resultVideo.id, "22546306")
        switch resultVideo.meta {
        case .video(let meta):
            XCTAssertEqual(meta.small.size, "400x225")
        default:
            XCTFail()
        }
        
        XCTAssertEqual(resultGifv.id, "21130559")
        switch resultGifv.meta {
        case .gifv(let meta):
            XCTAssertEqual(meta.size, "600x332")
        default:
            XCTFail()
        }
        
        XCTAssertEqual(resultAudio.id, "21165404")
        switch resultAudio.meta {
        case .audio(let meta):
            XCTAssertEqual(meta.audioEncode, "mp3")
        default:
            XCTFail()
        }
        
        XCTAssertEqual(resultUnkow.id, "106568090139741956")
        XCTAssertNil(resultUnkow.meta)
    }
}
