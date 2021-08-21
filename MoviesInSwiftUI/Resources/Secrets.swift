//
//  Secrets.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation

struct Secrets: Codable {
    let tmdbApiKey: String

    private static func load() -> Secrets {
        let secretsURL = Bundle.main.url(forResource: "Secrets", withExtension: "plist")!
        let decoder = PropertyListDecoder()
        return try! decoder.decode(Secrets.self, from: Data(contentsOf: secretsURL))
    }

    static let shared = load()
}
