//
//  AlbumDetailCell.swift
//  homeDepotChallenge
//
//  Created by RaveBizz on 2/7/21.
//

import UIKit

class AlbumDetailCell: UICollectionViewCell {

    static let identifier = String(describing: AlbumDetailCell.self)
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var viewModel: CellViewModel? {
        didSet {
            albumLabel.text = viewModel?.getAlbumName()
            artistLabel.text = viewModel?.getArtistName()
            releaseDateLabel.text = viewModel?.getReleaseDate()
            getImage()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(viewModel: CellViewModel?){
        self.viewModel = viewModel
    }
    
    func getImage() {
        guard let url = viewModel?.getImageURL() else {return}
        ImageSingleton.shared.getImage(with: url) { image in
            self.albumImageView.image = image
        }
    }
    
}
