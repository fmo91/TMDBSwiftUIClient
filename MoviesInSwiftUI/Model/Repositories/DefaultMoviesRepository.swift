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
            let id = tmdbMovie.id
        else {
            return nil
        }

        self.id = id
        self.posterPath = tmdbMovie.posterPath
        self.adult = tmdbMovie.adult
        self.overview = tmdbMovie.overview
        self.releaseDate = tmdbMovie.releaseDate
        self.genreIds = tmdbMovie.genreIds
        self.originalTitle = tmdbMovie.originalTitle
        self.title = tmdbMovie.title
        self.backdropPath = tmdbMovie.backdropPath
        self.popularity = tmdbMovie.popularity
        self.voteCount = tmdbMovie.voteCount
        self.video = tmdbMovie.video
        self.voteAverage = tmdbMovie.voteAverage
    }
}
