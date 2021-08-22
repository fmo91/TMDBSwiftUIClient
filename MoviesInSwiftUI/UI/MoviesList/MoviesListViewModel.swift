//
//  MoviesListViewModel.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

final class MoviesListViewModel: ObservableObject {
    @Published var movies: UIState<MoviesList> = .idle
    private var page = 0
    private let repository: MoviesRepository
    private var cancellables: Set<AnyCancellable> = []

    init(repository: MoviesRepository = DefaultMoviesRepository()) {
        self.repository = repository

        loadNextPage()
    }

    func loadNextPage() {
        page += 1
        repository
            .getMovies(page: page)
            .asUIState
            .assign(to: \.movies, on: self)
            .store(in: &cancellables)
    }
}
