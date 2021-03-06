//
// Anime.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Anime Resource */
public struct Anime: Codable, Hashable {

    public enum ModelType: String, Codable, CaseIterable {
        case tv = "TV"
        case ova = "OVA"
        case movie = "Movie"
        case special = "Special"
        case ona = "ONA"
        case music = "Music"
    }
    public enum Status: String, Codable, CaseIterable {
        case finishedAiring = "Finished Airing"
        case currentlyAiring = "Currently Airing"
        case notYetAired = "Not yet aired"
    }
    /** MyAnimeList ID */
    public var malId: Int
    /** MyAnimeList URL */
    public var url: String?
    public var images: AnimeImages?
    public var trailer: TrailerBase?
    /** Title */
    public var title: String?
    /** English Title */
    public var titleEnglish: String?
    /** Japanese Title */
    public var titleJapanese: String?
    /** Other Titles */
    public var titleSynonyms: [String]?
    /** Anime Type */
    public var type: ModelType?
    /** Original Material/Source adapted from */
    public var source: String?
    /** Episode count */
    public var episodes: Int?
    /** Airing status */
    public var status: Status?
    /** Airing boolean */
    public var airing: Bool?
    /** Parsed raw duration */
    public var duration: String?
    /** Score */
    public var score: Float?
    /** Number of users */
    public var scoredBy: Int?
    /** Ranking */
    public var rank: Int?
    /** Popularity */
    public var popularity: Int?
    /** Number of users who have added this entry to their list */
    public var members: Int?
    /** Number of users who have favorited this entry */
    public var favorites: Int?
    /** Synopsis */
    public var synopsis: String?
    /** Background */
    public var background: String?
    /** Year */
    public var year: Int?

    public init(malId: Int, url: String? = nil, images: AnimeImages? = nil, trailer: TrailerBase? = nil, title: String? = nil, titleEnglish: String? = nil, titleJapanese: String? = nil, titleSynonyms: [String]? = nil, type: ModelType? = nil, source: String? = nil, episodes: Int? = nil, status: Status? = nil, airing: Bool? = nil, duration: String? = nil, score: Float? = nil, scoredBy: Int? = nil, rank: Int? = nil, popularity: Int? = nil, members: Int? = nil, favorites: Int? = nil, synopsis: String? = nil, background: String? = nil, year: Int? = nil) {
        self.malId = malId
        self.url = url
        self.images = images
        self.trailer = trailer
        self.title = title
        self.titleEnglish = titleEnglish
        self.titleJapanese = titleJapanese
        self.titleSynonyms = titleSynonyms
        self.type = type
        self.source = source
        self.episodes = episodes
        self.status = status
        self.airing = airing
        self.duration = duration
        self.score = score
        self.scoredBy = scoredBy
        self.rank = rank
        self.popularity = popularity
        self.members = members
        self.favorites = favorites
        self.synopsis = synopsis
        self.background = background
        self.year = year
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case malId = "mal_id"
        case url
        case images
        case trailer
        case title
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case titleSynonyms = "title_synonyms"
        case type
        case source
        case episodes
        case status
        case airing
        case duration
        case score
        case scoredBy = "scored_by"
        case rank
        case popularity
        case members
        case favorites
        case synopsis
        case background
        case year
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(malId, forKey: .malId)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(images, forKey: .images)
        try container.encodeIfPresent(trailer, forKey: .trailer)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(titleEnglish, forKey: .titleEnglish)
        try container.encodeIfPresent(titleJapanese, forKey: .titleJapanese)
        try container.encodeIfPresent(titleSynonyms, forKey: .titleSynonyms)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(episodes, forKey: .episodes)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(airing, forKey: .airing)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(score, forKey: .score)
        try container.encodeIfPresent(scoredBy, forKey: .scoredBy)
        try container.encodeIfPresent(rank, forKey: .rank)
        try container.encodeIfPresent(popularity, forKey: .popularity)
        try container.encodeIfPresent(members, forKey: .members)
        try container.encodeIfPresent(favorites, forKey: .favorites)
        try container.encodeIfPresent(synopsis, forKey: .synopsis)
        try container.encodeIfPresent(background, forKey: .background)
        try container.encodeIfPresent(year, forKey: .year)
    }
}

