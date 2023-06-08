//
//  SearchViewModel.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import Combine

@MainActor
class SearchViewModel: ObservableObject {
    @Published var songs = [Song]()
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var hasMoreSongs = true
    @Published var error: NetworkError?

    private var offset = 0
    private let limit = 25
    private let api: API

    init(apiService: API) {
        self.api = apiService
    }

    func searchMusic() {
        guard !isLoading else { return }
        guard hasMoreSongs else { return }
    
        isLoading = true
        Task {
            do {
                let newSongs = try await api.searchMusic(with: searchText, offset: offset)
                hasMoreSongs = !newSongs.isEmpty
                songs.append(contentsOf: newSongs)
                offset += limit
            } catch let error as NetworkError {
                self.error = error
            } catch {
                self.error = .networkError(error)
            }
            isLoading = false
        }
    }

    func search() {
        songs.removeAll()
        offset = 0
        hasMoreSongs = true
        searchMusic()
    }
}




