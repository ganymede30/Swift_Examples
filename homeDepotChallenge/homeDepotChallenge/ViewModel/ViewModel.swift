//
//  ViewModel.swift
//  homeDepotChallenge
//
//  Created by RaveBizz on 2/7/21.
//

import Foundation

class ViewModel {
    var numItems: Int? {
        dataVM?.count
    }
    
    var dataVM: [CellViewModel]? {
        didSet {
            DispatchQueue.main.async {
                self.updateViewClosure?()
            }
        }
    }
    
//    private func sortTrackList() {
//        let sorted = model?.results?.sorted(by: {$0.dateFromString.compare($1.dateFromString) == .orderedDescending})
//        model?.results = sorted
//      }
    
    var linkString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    
    var updateViewClosure: (() -> Void)?
    
    func downloadAlbums(){
        print("downloading albums")
        guard let url = URL(string: linkString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("error request not successful")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                var decodedAlbums = try decoder.decode(AlbumTopLevel.self, from: data)
                print("decodedAlbums", decodedAlbums.feed.results)
                let sorted = decodedAlbums.feed.results.sorted(by: {$0.dateFromString.compare($1.dateFromString) == .orderedAscending})
                decodedAlbums.feed.results = sorted
                self.updateDataVM(decodedModel: decodedAlbums)
            } catch let error {
                print("decoding unsuccessful", error)
            }
        }
        task.resume()
    }
    
    func updateDataVM(decodedModel: AlbumTopLevel) {
        dataVM = decodedModel.feed.results.map { album in
//            print("album", album)
            let cellVM = CellViewModel(album: album)
            return cellVM
        }
    }
}
