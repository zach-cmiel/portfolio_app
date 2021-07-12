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
        
        cell.buildAlbumCover(image: self.viewModel.getProjectImage(i: indexPath.item), desc: self.viewModel.getProjectFullDesc(i: indexPath.item), bgImage: self.viewModel.getProjectBgImage(i: indexPath.item), textColor: self.viewModel.getProjectTextColor(i: indexPath.item))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AlbumCollectionViewCell
        
        // change to next slide
        cell.nextSlide()
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = getCurrentCell()
        
        if self.currentIndex != currentIndex.item {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
        
        updateTitles(i: currentIndex.item)
    }
}
