//
//  Functions.swift
//  
//
//  Created by Fledge Shiu on 2021/5/16.
//

import Foundation
import CryptoKit

protocol Endpoint {}

func generateParametersHash(data: Data) -> String {
    return SHA256.hash(data: data).description
}

func toQueryItem(parameter: Parameter) -> URLQueryItem? {
    guard let value = parameter.value else { return nil }
    return URLQueryItem(name: parameter.key, value: value)
}

func toString(parameter: Parameter) -> String? {
    return parameter.value?
        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        .map { value in "\(parameter.key)=\(value)" }
}

func trueOrNil(_ flag: Bool) -> String? {
    return flag ? "true" : nil
}

func between(_ min: Int, and max: Int, default: Int) -> (Int) -> Int {
    return { limit in (limit >= min && limit <= max) ? limit : `default` }
}

func toOptionalString<A>(optional: A?) -> String? {
    return optional.map(String.init(describing:))
}

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

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
