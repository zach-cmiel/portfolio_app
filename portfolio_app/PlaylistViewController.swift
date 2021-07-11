//
//  PlaylistViewController.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/8/21.
//

import UIKit

class PlaylistViewController: UIViewController {
    
    // views
    private var blobs: [UIImageView] = []
    private var playlistCover: UIImageView!
    private var playlistTitle: UILabel!
    private var playlistDesc: UILabel!
    private var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set the background color
        view.backgroundColor = .systemBackground
        
        // set up views
        setUpViews()
    }
    
    // set up views
    func setUpViews() {
        // blobs
        for _ in 1...5 {
            let blob = UIImageView(frame: .zero)
            blob.translatesAutoresizingMaskIntoConstraints = false
            blob.image = UIImage(named: "blob")
            blob.alpha = CGFloat.random(in: 0.4...0.6)
            blob.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360) * 180.0/CGFloat.pi)
            view.addSubview(blob)
            
            blobs.append(blob)
        }
        
        // playlist cover
        playlistCover = UIImageView(frame: .zero)
        playlistCover.translatesAutoresizingMaskIntoConstraints = false
        playlistCover.image = UIImage(named: "playlist_cover")
        view.addSubview(playlistCover)
        
        // playlist title
        playlistTitle = UILabel(frame: .zero)
        playlistTitle.translatesAutoresizingMaskIntoConstraints = false
        playlistTitle.text = "My Portfolio"
        playlistTitle.textColor = UIColor(named: "LabelTextColor")
        playlistTitle.textAlignment = .center
        let playlistTitleSize = view.frame.size.height * 0.033
        playlistTitle.font = UIFont.systemFont(ofSize: playlistTitleSize, weight: .bold)
        view.addSubview(playlistTitle)
        
        // playlist desc
        playlistDesc = UILabel(frame: .zero)
        playlistDesc.translatesAutoresizingMaskIntoConstraints = false
        playlistDesc.text = "a playlist of my projects"
        playlistDesc.numberOfLines = 0
        playlistDesc.lineBreakMode = .byWordWrapping
        playlistDesc.textColor = UIColor(named: "LabelTextColor")
        playlistDesc.textAlignment = .center
        let playlistDescSize = view.frame.size.height * 0.019
        playlistDesc.font = UIFont.systemFont(ofSize: playlistDescSize, weight: .regular)
        view.addSubview(playlistDesc)
        
        // play button
        playButton = UIButton(frame: .zero)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setBackgroundImage(UIImage(named: "play_button"), for: .normal)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        view.addSubview(playButton)
        
        // set up the constraints
        setUpConstraints()
    }
    
    // set up view constraints
    func setUpConstraints() {
        // all views have centerX of superview
        NSLayoutConstraint.activate([
            playlistCover.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playlistTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playlistDesc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for (i, blob) in blobs.enumerated() {
            var constantMultiplier = CGFloat.random(in: 0.42...0.46)
            if i < 3 {
                constantMultiplier = CGFloat.random(in: 0.35...0.375)
            }
            
            NSLayoutConstraint.activate([
                blob.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.6),
                blob.widthAnchor.constraint(equalTo: blob.heightAnchor),
                blob.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                blob.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.size.height * constantMultiplier)
            ])
        }
        
        NSLayoutConstraint.activate([
            playlistCover.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            playlistCover.heightAnchor.constraint(equalTo: playlistCover.widthAnchor),
            playlistDesc.widthAnchor.constraint(equalTo: playlistCover.widthAnchor),
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor)
        ])
        
        // y positions
        let coverTopPadding = view.frame.size.height * 0.15
        let titleTopPadding = view.frame.size.height * 0.03
        let descTopPadding = view.frame.size.height * 0.02
        let playButtonTopPadding = view.frame.size.height * 0.15
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(coverTop)-[cover]-(titleTop)-[title]-(descTop)-[desc]-(playTop)-[play]", options: [], metrics: ["coverTop": coverTopPadding, "titleTop": titleTopPadding, "descTop": descTopPadding, "playTop": playButtonTopPadding], views: ["play": playButton!, "desc": playlistDesc!, "title": playlistTitle!, "cover": playlistCover!]))
        
        view.layoutSubviews()
        
        animateViewsIn()
        
    }
    
    func animateViewsIn() {
        // rotate blob
        for (i, blob) in blobs.enumerated() {
            rotateBlob(i: i, blob: blob)
        }
    }
    
    func rotateBlob(i: Int, blob: UIImageView) {
        var duration = Double.random(in: 50.0...80.0)
        if i < 3 {
            duration = Double.random(in: 20.0...40.0)
        }

        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            blob.transform = blob.transform.rotated(by: CGFloat.pi)
        }) { _ in
            self.rotateBlob(i: i, blob: blob)
            
        }
    }
    
    @objc func play() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        // go to project vc
        navigationController?.pushViewController(ProjectViewController(), animated: false)
    }
}

