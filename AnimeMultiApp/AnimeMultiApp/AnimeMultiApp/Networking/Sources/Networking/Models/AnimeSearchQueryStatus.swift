//
// AnimeSearchQueryStatus.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Available Anime statuses */
public enum AnimeSearchQueryStatus: String, Codable, CaseIterable {
    case airing = "airing"
    case complete = "complete"
    case upcoming = "upcoming"
}