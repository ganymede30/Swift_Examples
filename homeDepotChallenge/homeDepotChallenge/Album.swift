//
//  Album.swift
//  homeDepotChallenge
//
//  Created by RaveBizz on 2/7/21.
//

import Foundation

struct AlbumTopLevel: Decodable {
    var feed: Feed
}

struct Feed: Decodable {
    var results: [Album]
}

struct Album: Decodable {
    let artistName: String
    let releaseDate: String
    let name: String
    let artworkUrl100: String
    var dateFromString: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: self.releaseDate ?? "") ?? Date()
        print(date)
        return date
    }
}
