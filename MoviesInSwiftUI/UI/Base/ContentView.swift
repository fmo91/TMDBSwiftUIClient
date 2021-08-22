//
//  ContentView.swift
//  MoviesInSwiftUI
//
//  Created by Fernando Ortiz - Parser on 21/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MoviesListScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
