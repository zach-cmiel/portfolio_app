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
    
    // description
    var bgView: UIImageView!
    var descStr: String!
    var descriptionLabel: UITextView!
    var bgImage: UIImage!
    var textColor: UIColor!
    
    var slideNum = 0
    
    func buildAlbumCover(image: UIImage, desc: String, bgImage: UIImage, textColor: UIColor) {
        self.albumCover = image
        self.descStr = desc
        self.bgImage = bgImage
        self.textColor = textColor
                
        if let _ = self.albumCoverView {
            self.albumCoverView.image = self.albumCover
        } else {
            setUpViews()
        }
        
        if let _ = self.bgView {
            self.bgView.image = self.bgImage
        }
        
        if let _ = self.descriptionLabel {
            self.descriptionLabel.text = self.descStr
            self.descriptionLabel.textColor = self.textColor
            self.descriptionLabel.setContentOffset(.zero, animated: false)
        }
        
        // scroll to 0
        slideNum = 2
        nextSlide()
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
        
        // create description and hide it initially
        bgView = UIImageView(frame: .zero)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.image = bgImage
        bgView.clipsToBounds = true
        bgView.layer.masksToBounds = true
        bgView.contentMode = .scaleAspectFill
        bgView.alpha = 0.0
        addSubview(bgView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[bgView]-(padding)-|",
                                                      options: [],
                                                      metrics: ["padding": padding],
                                                      views: ["bgView": bgView!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[bgView]-0-|",
                                                      options: [],
                                                      metrics: ["padding": padding],
                                                      views: ["bgView": bgView!]))
        
        descriptionLabel = UITextView(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.text = descStr
        descriptionLabel.textAlignment = .left
        descriptionLabel.showsVerticalScrollIndicator = false
        descriptionLabel.isEditable = false
        descriptionLabel.font = UIFont.systemFont(ofSize: frame.size.height * 0.075, weight: .regular)
        descriptionLabel.textColor = self.textColor
        descriptionLabel.alpha = 0.0
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.widthAnchor.constraint(equalTo: bgView.widthAnchor, multiplier: 0.85),
            descriptionLabel.heightAnchor.constraint(equalTo: bgView.heightAnchor, multiplier: 0.85),
            descriptionLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor)
        ])
    }
    
    func nextSlide() {
        slideNum += 1
        if slideNum >= 2 {
            slideNum = 0
        }
        
        switch slideNum {
        case 0:
            // cover image
            UIView.animate(withDuration: 0.25) {
                self.descriptionLabel.alpha = 0.0
            } completion: { _ in
                UIView.animate(withDuration: 0.25) {
                    self.bgView.alpha = 0.0
                    self.albumCoverView.alpha = 1.0
                }
            }

            break
        case 1:
            // text description
            UIView.animate(withDuration: 0.25) {
                self.albumCoverView.alpha = 0.0
                self.bgView.alpha = 1.0
            } completion: { _ in
                UIView.animate(withDuration: 0.25) {
                    self.descriptionLabel.alpha = 1.0
                }
            }
            
            break
        default:
            break
        }
    }
}
