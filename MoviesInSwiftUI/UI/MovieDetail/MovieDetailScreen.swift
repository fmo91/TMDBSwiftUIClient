//
//  MovieDetailScreen.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 22/08/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailScreen: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            WebImage(url: URL(string: movie.posterPath ?? ""))
                .resizable()
                .frame(height: 400)
                .padding()
        }
    }
}
