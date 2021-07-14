//
//  Functions.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation

protocol Endpoint {}

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
}

extension Date {
    var iso8601withFractionalSeconds: String { return Formatter.iso8601withFractionalSeconds.string(from: self) }
}

extension String {
    var iso8601withFractionalSeconds: Date? { return Formatter.iso8601withFractionalSeconds.date(from: self) }
}

// For some reasons, Mastodon doesn't support parameters like `foo[]=1&foo[]2` or `foo=1&foo=2` in OAuthScopes
extension Array where Element == OAuthScopes {
    func toString() -> String {
        return self.reduce("") { result, element in
            return "\(result) \(element)"
        }
    }
}
