//
//  TMDBAPIClient.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

protocol TMDBAPIClient {
    func getTopRatedMovies(page: Int) -> AnyPublisher<TMDBTopRatedMoviesResponse, Error>
}
