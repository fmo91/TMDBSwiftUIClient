//
//  NetworkClient.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

protocol NetworkClient {
    func dispatch<Result: Decodable>(request: NetworkRequest) -> AnyPublisher<Result, Error>
}

struct DefaultNetworkClient: NetworkClient {
    let baseURL: String
    let middlewares: [NetworkClientMiddleware]
    let session: URLSession

    init(
        baseURL: String,
        middlewares: [NetworkClientMiddleware] = [],
        session: URLSession = .shared
    ) {
        self.baseURL = baseURL
        self.middlewares = middlewares
        self.session = session
    }

    func dispatch<Result: Decodable>(request: NetworkRequest) -> AnyPublisher<Result, Error> {
        var requestCopy = request
        middlewares.forEach { $0.prepare(request: &requestCopy) }
        do {
            return session
                .dataTaskPublisher(for: try requestCopy.urlRequest(baseURL: baseURL))
                .map(\.data)
                .receive(on: DispatchQueue.main)
                .decode(type: Result.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}

protocol NetworkClientMiddleware {
    func prepare(request: inout NetworkRequest)
}
