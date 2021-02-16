//
//  ViewController.swift
//  homeDepotChallenge
//
//  Created by RaveBizz on 2/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: AlbumDetailCell.identifier, bundle: nil), forCellWithReuseIdentifier: AlbumDetailCell.identifier)
        getData()
        setUpVMClosure()
    }

    func getData() {
        viewModel.downloadAlbums()
    }
    
    func setUpVMClosure(){
        viewModel.updateViewClosure = {
            self.collectionView.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumDetailCell.identifier, for: indexPath) as? AlbumDetailCell else { return UICollectionViewCell() }
        let cellViewModel = viewModel.dataVM?[indexPath.row]
        cell.bind(viewModel: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let totalWidth = collectionView.bounds.size.width
//        let numberOfCellsPerRow = 1
//        let oddEven = indexPath.row / numberOfCellsPerRow % 2
//        let dimensions = CGFloat(Int(totalWidth) / numberOfCellsPerRow)
//        if (oddEven == 0) {
//            return CGSize(width: dimensions, height: dimensions)
//        } else {
//            return CGSize(width: dimensions, height: dimensions/2)
//        }
        return CGSize(width: 400, height: 400)
    }
}

