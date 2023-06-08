//
//  ContentView.swift
//  ItunesDemoApp
//
//  Created by talate on 7.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SearchView(viewModel: SearchViewModel(apiService: APIService()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
