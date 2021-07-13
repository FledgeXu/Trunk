//
//  File.swift
//  
//
//  Created by Fledge Shiu on 2021/4/21.
//

import Foundation

/// Represents a proof from an external identity provider.
public class IdentityProof: Codable {
    // Attributes
    /// The name of the identity provider.
    public let provider: String
    /// The account owner's username on the identity provider's service.
    public let providerUsername: String
    /// The account owner's profile URL on the identity provider.
    public let profileURL: URL
    ///  link to a statement of identity proof, hosted by the identity provider.
    public let proofURL: URL
    /// When the identity proof was last updated.
    public let updatedAt: String
    private enum CodingKeys: String, CodingKey {
        case provider
        case providerUsername = "provider_username"
        case profileURL = "profile_url"
        case proofURL = "proof_url"
        case updatedAt = "updated_at"
    }
}
