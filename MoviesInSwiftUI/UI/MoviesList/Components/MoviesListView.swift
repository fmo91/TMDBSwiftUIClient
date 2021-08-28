//
//  MoviesListView.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import SwiftUI

struct MoviesListView<V: View>: View {
    let movies: [Movie]
    let destination: (Movie) -> V

    var body: some View {
        List(movies) { movie in
            NavigationLink(
                destination: destination(movie),
                label: {
                    MovieCell(movie: movie)
                }
            )
        }
    }
}
