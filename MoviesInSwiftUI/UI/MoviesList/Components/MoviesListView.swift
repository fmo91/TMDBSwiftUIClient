//
//  MoviesListView.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import SwiftUI

struct MoviesListView: View {
    let movies: [Movie]

    var body: some View {
        List(movies) { movie in
            MovieCell(movie: movie)
        }
    }
}
