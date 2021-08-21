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
        List(viewModel.movies) { movie in
            Text(movie.title)
        }
    }
}
