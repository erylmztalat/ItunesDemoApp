//
//  SearchViewModelTest.swift
//  ItunesDemoAppTests
//
//  Created by talate on 9.06.2023.
//

@testable import ItunesDemoApp
import XCTest

class MockAPIService: API {
    var songs: [Song] = [
        Song(trackName: "track1", artistName: "artist1", collectionName: "collection1", artworkUrl60: "1artwork60", artworkUrl100: "1artwork100", trackViewUrl: "trackViewUrl1", releaseDate: "releaseDate1", primaryGenreName: "genre1"),
        Song(trackName: "track2", artistName: "artist2", collectionName: "collection2", artworkUrl60: "2artwork60", artworkUrl100: "2artwork100", trackViewUrl: "trackViewUrl2", releaseDate: "releaseDate2", primaryGenreName: "genre2"),
        Song(trackName: "track3", artistName: "artist3", collectionName: "collection3", artworkUrl60: "3artwork60", artworkUrl100: "3artwork100", trackViewUrl: "trackViewUrl3", releaseDate: "releaseDate3", primaryGenreName: "genre3"),
        Song(trackName: "track4", artistName: "artist4", collectionName: "collection4", artworkUrl60: "4artwork60", artworkUrl100: "4artwork100", trackViewUrl: "trackViewUrl4", releaseDate: "releaseDate4", primaryGenreName: "genre4"),
        Song(trackName: "track5", artistName: "artist5", collectionName: "collection5", artworkUrl60: "5artwork60", artworkUrl100: "5artwork100", trackViewUrl: "trackViewUrl5", releaseDate: "releaseDate5", primaryGenreName: "genre5") ]

    func searchMusic(with term: String, offset: Int = 0) async throws -> [Song] {
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000) // 1 second
        return songs
    }
}

final class SearchViewModelTest: XCTestCase {
    
    var searchViewModel: SearchViewModel!
    var mockAPI: MockAPIService!

    @MainActor override func setUp() {
        super.setUp()
        mockAPI = MockAPIService()
        searchViewModel = .init(apiService: mockAPI)
    }

    override func tearDown() {
        searchViewModel = nil
        mockAPI = nil
        super.tearDown()
    }
    
    func testSearch() {
        Task {
            await searchViewModel.searchMusic()
            try? await Task.sleep(for: .seconds(3))
            let searchViewModelSongs = await searchViewModel.songs
            let mockAPISongs = mockAPI.songs
            XCTAssertEqual(searchViewModelSongs, mockAPISongs)
        }
    }

}
