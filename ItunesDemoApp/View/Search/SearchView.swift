//
//  SearchView.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            Group {
                if viewModel.songs.isEmpty {
                    EmptyView()
                } else {
                    List {
                        ForEach(viewModel.songs, id: \.id) { song in
                            VStack(alignment: .leading) {
                                Text(song.trackName)
                                Text(song.artistName)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $viewModel.searchText)
        }
        .onAppear {
            viewModel.searchMusic()
        }
    }
}





