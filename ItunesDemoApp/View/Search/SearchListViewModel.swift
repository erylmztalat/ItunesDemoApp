//
//  SearchListViewModel.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import Foundation
import SwiftUI

class SearchListViewModel: ObservableObject {
    @Published var imageData: Data?
    private let imageLoader: ImageLoader
    let song: Song
    
    init(song: Song, imageLoader: ImageLoader = URLImageLoader()) {
        self.song = song
        self.imageLoader = imageLoader
    }

    func loadImage() {
        guard let url = URL(string: song.artworkUrl60) else { return }
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


