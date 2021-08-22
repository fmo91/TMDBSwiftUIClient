//
//  MovieCell.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MovieCell: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            WebImage(url: URL(string: movie.posterPath ?? ""))
                .resizable()
                .frame(height: 300)
                .clipped()
                .padding([.bottom], 6.0)
            Text(movie.title ?? "")
                .font(.headline)
            Text(movie.overview ?? "")
                .font(.subheadline)
        }
        .padding()
    }
}
