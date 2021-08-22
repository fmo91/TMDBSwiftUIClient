//
//  MoviesRepository.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

protocol MoviesRepository {
    func getMovies(page: Int) -> AnyPublisher<MoviesList, Error>
}
