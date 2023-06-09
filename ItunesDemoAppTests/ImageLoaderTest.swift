//
//  ImageLoaderTest.swift
//  ItunesDemoAppTests
//
//  Created by talate on 9.06.2023.
//

@testable import ItunesDemoApp
import XCTest

final class ImageLoaderTest: XCTestCase {
    func testImageFetching() async throws {
        let imageLoader = URLImageLoader()
        let imageURL = URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/98/43/07/98430737-5d94-2459-9677-0d4efef91c5e/artwork.jpg/60x60bb.jpg")!

        let image = try await imageLoader.loadImage(from: imageURL)
        XCTAssertNotNil(image)
    }
}
