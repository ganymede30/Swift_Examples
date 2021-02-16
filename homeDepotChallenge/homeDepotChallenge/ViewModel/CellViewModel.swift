//
//  CellViewModel.swift
//  homeDepotChallenge
//
//  Created by RaveBizz on 2/7/21.
//

import Foundation

class CellViewModel {
    private var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    func getArtistName() -> String {
        return album.artistName
    }
    
    func getAlbumName() -> String {
        return album.name
    }
    
    func getReleaseDate() -> String {
        return album.releaseDate
    }
    
    func getImageURL() -> URL {
        guard let url = URL(string: album.artworkUrl100) else {
            return URL(string: "https://www.google.com")!
        }
        return url
    }
}
