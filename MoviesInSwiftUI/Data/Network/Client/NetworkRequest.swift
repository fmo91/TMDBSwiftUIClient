//
//  NetworkRequest.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation

struct NetworkRequest {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case head = "HEAD"
        case delete = "DELETE"
    }

    var endpoint: String
    var method: Method
    var headers: [String: String]
    var queryParams: [String: String?]
    var body: Data?

    init(
        endpoint: String,
        method: Method = .get,
        headers: [String: String] = [:],
        queryParams: [String: String?] = [:],
        body: Data? = nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.headers = headers
        self.queryParams = queryParams
        self.body = body
    }

    init(
        endpoint: String,
        method: Method = .get,
        headers: [String: String] = [:],
        queryParams: [String: String?] = [:],
        body: [String: Any?]
    ) {
        let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
        self.init(
            endpoint: endpoint,
            method: method,
            headers: headers,
            queryParams: queryParams,
            body: bodyData
        )
    }

    init<Body: Encodable>(
        endpoint: String,
        method: Method = .get,
        headers: [String: String] = [:],
        queryParams: [String: String?] = [:],
        body: Body
    ) {
        let encoder = JSONEncoder()
        let bodyData = try? encoder.encode(body)

        self.init(
            endpoint: endpoint,
            method: method,
            headers: headers,
            queryParams: queryParams,
            body: bodyData
        )
    }
}

enum NetworkRequestError: Error {
    case invalidURL
}

extension NetworkRequest {
    func buildURL(from baseURL: String) throws -> URL {
        guard var urlComponents = URLComponents(string: "\(baseURL)\(self.endpoint)") else {
            throw NetworkRequestError.invalidURL
        }

        var queryItems: [URLQueryItem] = []
        for (name, value) in queryParams {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            throw NetworkRequestError.invalidURL
        }

        return url
    }

    func urlRequest(baseURL: String) throws -> URLRequest {
        var request = URLRequest(url: try buildURL(from: baseURL))
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
}
