//
//  MoviesListViewModel.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

final class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
}
