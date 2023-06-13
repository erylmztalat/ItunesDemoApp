//
//  SearchView.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            Group {
                if let error = viewModel.error, !viewModel.searchText.isEmpty {
                    EmptyStateView(imageName: "exclamationmark.triangle.fill", message: error.localizedDescription)
                } else if viewModel.songs.isEmpty {
                    EmptyStateView()
                } else {
                    List() {
                        ForEach(viewModel.songs, id: \.id) { song in
                            SearchListView(songViewModel: SongViewModel(song: song, imageLoader: URLImageLoader()))
                                .onAppear {
                                    if song == viewModel.songs.last {
                                        viewModel.loadMoreMusics(for: song)
                                    }
                                }
                            
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText)
        }
        .onChange(of: viewModel.searchText) { newText in
            viewModel.search()
        }
    }
}





