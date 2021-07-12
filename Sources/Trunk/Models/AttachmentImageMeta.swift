//
//  AttachmentImageMeta.swift
//
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a file or media attachment that can be added to a status.
public class AttachmentImageMeta: Codable {
    public class MetaSize: Codable {
        public let width: Int
        public let height: Int
        public let size: String
        public let aspect: Double
    }
    public class MetaFocus: Codable {
        public let x: Double
        public let y: Double
    }
    public let original: MetaSize?
    public let small: MetaSize?
    public let focus: MetaFocus?
}
