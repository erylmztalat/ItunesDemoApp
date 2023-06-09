//
//  DateFormatterService.swift
//  ItunesDemoApp
//
//  Created by talate on 9.06.2023.
//

import Foundation

struct DateFormatterService {
    private let inputFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" 
        return formatter
    }()

    private let outputFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()

    func convert(dateString: String) -> String? {
        guard let date = inputFormatter.date(from: dateString) else { return nil }
        return outputFormatter.string(from: date)
    }
}
