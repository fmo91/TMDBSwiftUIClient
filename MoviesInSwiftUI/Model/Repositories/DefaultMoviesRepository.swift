//
//  DefaultMoviesRepository.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

final class DefaultMoviesRepository: MoviesRepository {
    func getMovies() -> AnyPublisher<[Movie], Error> {
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
