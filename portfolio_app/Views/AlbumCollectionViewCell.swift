//
//  AlbumCollectionViewCell.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/10/21.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    // album cover
    var albumCover: UIImage!
    var albumCoverView: UIImageView!
    
    func buildAlbumCover(image: UIImage) {
        albumCover = image
        
        if let _ = albumCoverView {
            albumCoverView.image = albumCover
        } else {
            setUpViews()
        }
    }
    
    func setUpViews() {
        // create image view
        albumCoverView = UIImageView(frame: .zero)
        albumCoverView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverView.image = albumCover
        albumCoverView.clipsToBounds = true
        albumCoverView.layer.masksToBounds = true
        albumCoverView.contentMode = .scaleAspectFill
        addSubview(albumCoverView)
        
        // constraints
        let padding = frame.size.width * 0.057971015
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[image]-(padding)-|",
                                                      options: [],
                                                      metrics: ["padding": padding],
                                                      views: ["image": albumCoverView!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[image]-0-|",
                                                      options: [],
                                                      metrics: ["padding": padding],
                                                      views: ["image": albumCoverView!]))
    }
}
