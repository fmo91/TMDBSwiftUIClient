//
//  TMDBMovie.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation

struct TMDBMovie: Decodable {
    let posterPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    let genreIds: [Int]?
    let id: Int?
    let originalTitle: String?
    let title: String?
    let backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult = "adult"
        case overview = "overview"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id = "id"
        case originalTitle = "original_title"
        case title = "title"
        case backdropPath = "backdrop_path"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case video = "video"
        case voteAverage = "vote_average"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
    }
}
