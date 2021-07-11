//
//  ProjectViewController+Extensions.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/10/21.
//

import UIKit

extension ProjectViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getProjectCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cover", for: indexPath) as! AlbumCollectionViewCell
        
        cell.buildAlbumCover(image: UIImage(named: "playlist_cover")!)
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = getCurrentCell()
        updateTitles(i: currentIndex.item)
    }
}
