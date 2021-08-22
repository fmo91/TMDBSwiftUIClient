//
//  DefaultMoviesRepository.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

final class DefaultMoviesRepository: MoviesRepository {
    let apiClient: TMDBAPIClient

    init(apiClient: TMDBAPIClient = TMDBAPIDefaultClient()) {
        self.apiClient = apiClient
    }

    func getMovies(page: Int) -> AnyPublisher<MoviesList, Error> {
        apiClient.getTopRatedMovies(page: page)
            .map { (result) -> MoviesList in
                let results = result.results ?? []
                return MoviesList(
                    isThereMoreContent: (result.totalPages ?? 0) > (result.page ?? 0),
                    movies: results.compactMap { Movie(tmdbMovie: $0) }
                )
            }
            .eraseToAnyPublisher()
    }
}

extension Movie {
    init?(tmdbMovie: TMDBMovie) {
        guard
            let id = tmdbMovie.id,
            let title = tmdbMovie.title
        else {
            return nil
        }

        self.id = id.description
        self.title = title
    }
}
