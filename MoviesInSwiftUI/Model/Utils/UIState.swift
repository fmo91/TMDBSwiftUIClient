//
//  UIState.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation

enum UIState<Model> {
    case idle
    case loading
    case error(Error)
    case loaded(Model)
}
