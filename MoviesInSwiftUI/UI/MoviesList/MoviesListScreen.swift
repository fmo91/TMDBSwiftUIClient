//
//  MoviesListScreen.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import SwiftUI

struct MoviesListScreen: View {
    @StateObject var viewModel = MoviesListViewModel()

    var body: some View {
        switch viewModel.movies {
        case .idle, .loading:
            Text("Loading...")
        case .error(let error):
            Text("Failed :: \(error.localizedDescription)")
        case .loaded(let movies):
            List(movies.movies) { movie in
                Text("Movie: \(movie.title)")
            }
        }
    }
}
