//
//  TMDBAPIDefaultClient.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

final class TMDBAPIDefaultClient: TMDBAPIClient {
    let networkClient: NetworkClient

    init(
        networkClient: NetworkClient = DefaultNetworkClient(
            baseURL: "https://api.themoviedb.org/3",
            middlewares: [TMDBAPIAuthenticationMiddleware()]
        )
    ) {
        self.networkClient = networkClient
    }

    func getTopRatedMovies(page: Int) -> AnyPublisher<TMDBTopRatedMoviesResponse, Error> {
        return networkClient.dispatch(request: NetworkRequest(
            endpoint: "/movie/top_rated",
            queryParams: ["page": String(page)]
        ))
    }
}

struct TMDBAPIAuthenticationMiddleware: NetworkClientMiddleware {
    func prepare(request: inout NetworkRequest) {
        request.queryParams["api_key"] = Secrets.shared.tmdbApiKey
    }
}
