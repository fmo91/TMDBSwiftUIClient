//
//  TMDBTopRatedMoviesResponse.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation

struct TMDBTopRatedMoviesResponse: Decodable {
    let page: Int?
    let results: [TMDBMovie]?
    let totalResults: Int?
    let totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.results = try container.decodeIfPresent([TMDBMovie].self, forKey: .results)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
    }
}
