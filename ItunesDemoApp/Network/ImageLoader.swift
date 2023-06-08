//
//  ImageLoader.swift
//  ItunesDemoApp
//
//  Created by talate on 8.06.2023.
//

import Foundation
import SwiftUI

protocol ImageLoader {
    func loadImage(from url: URL) async throws -> UIImage
}

struct URLImageLoader: ImageLoader {
    func loadImage(from url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw NetworkError.decodingError(DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Failed to create image from data")))
        }
        return image
    }
}
