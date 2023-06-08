//
//  NetworkError.swift
//  ItunesDemoApp
//
//  Created by talate on 7.06.2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidResponse
    case emptyData
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Unexpected server response. Try again later."
        case .emptyData:
            return "No server response. Try again later."
        case .decodingError(let error):
            return "Trouble processing data (error: \(error.localizedDescription)). Try again later."
        case .networkError(let error):
            return "Network error (error: \(error.localizedDescription)). Check internet connection and try again."
        }
    }
}


