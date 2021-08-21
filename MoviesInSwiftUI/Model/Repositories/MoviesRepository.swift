//
//  MoviesRepository.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

protocol MoviesRepository {
    func getMovies() -> AnyPublisher<[Movie], Error>
}
