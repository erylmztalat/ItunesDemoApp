//
//  SearchListViewModel.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import Foundation

enum ImageSize {
    case small
    case large
}

class SongViewModel: ObservableObject {
    @Published var imageData: Data?
    private let imageLoader: ImageLoader
    let song: Song
    
    init(song: Song, imageLoader: ImageLoader = URLImageLoader()) {
        self.song = song
        self.imageLoader = imageLoader
    }

    func loadImage(for size: ImageSize) {
        let urlStr: String
        switch size {
        case .small:
            urlStr = song.artworkUrl60
        case .large:
            urlStr = song.artworkUrl100
        }
        guard let url = URL(string: urlStr) else { return }
        Task {
            do {
                let image = try await imageLoader.loadImage(from: url)
                DispatchQueue.main.async { [weak self] in
                    self?.imageData = image.jpegData(compressionQuality: 1.0)
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
    }
}


