//
//  Song.swift
//  ItunesDemoApp
//
//  Created by talate on 7.06.2023.
//

import Foundation

struct Song: Identifiable, Equatable, Codable {
    let id = UUID()
    let trackName: String
    let artistName: String
    let collectionName: String
    let artworkUrl60: String
    let artworkUrl100: String
    let trackViewUrl: String
    let releaseDate: String
    let primaryGenreName: String
}


