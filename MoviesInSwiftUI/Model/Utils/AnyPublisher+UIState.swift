//
//  AnyPublisher+UIState.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import Foundation
import Combine

extension AnyPublisher where Failure : Error {
    var asUIState: AnyPublisher<UIState<Output>, Never> {
        self.map { (model: Output) -> UIState<Output> in
                return UIState<Output>.loaded(model)
            }
            .catch { (error: Error) in
                return Just(UIState<Output>.error(error))
                    .eraseToAnyPublisher()
            }
            .prepend(UIState<Output>.loading)
            .eraseToAnyPublisher()
    }
}
