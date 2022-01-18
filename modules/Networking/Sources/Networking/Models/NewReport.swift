//
// NewReport.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct NewReport: Codable, Hashable {

    public var title: String
    public var url: String
    public var imageUrl: String
    public var newsSite: String
    public var summary: String?
    public var publishedAt: String

    public init(title: String, url: String, imageUrl: String, newsSite: String, summary: String? = nil, publishedAt: String) {
        self.title = title
        self.url = url
        self.imageUrl = imageUrl
        self.newsSite = newsSite
        self.summary = summary
        self.publishedAt = publishedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case title
        case url
        case imageUrl
        case newsSite
        case summary
        case publishedAt
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(url, forKey: .url)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(newsSite, forKey: .newsSite)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encode(publishedAt, forKey: .publishedAt)
    }
}
