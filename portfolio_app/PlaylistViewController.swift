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
    
    // vertical constraint
    private var coverTopPadding: CGFloat!
    private var titleTopPadding: CGFloat!
    private var descTopPadding: CGFloat!
    private var playButtonTopPadding: CGFloat!
    private var verticalConstraint: [NSLayoutConstraint]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set the background color
        view.backgroundColor = .systemBackground
        
        // set up views
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // animate in if necessary
        animateViewsIn()
    }
    
    // set up views
    func setUpViews() {
        // blobs
        for _ in 1...5 {
            let blob = UIImageView(frame: .zero)
            blob.translatesAutoresizingMaskIntoConstraints = false
            blob.image = UIImage(named: "blob")
            blob.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360) * 180.0/CGFloat.pi)
            blob.alpha = 0.0
            view.addSubview(blob)
            
            blobs.append(blob)
        }
        
        // playlist cover
        playlistCover = UIImageView(frame: .zero)
        playlistCover.translatesAutoresizingMaskIntoConstraints = false
        playlistCover.image = UIImage(named: "playlist_cover")
        playlistCover.alpha = 0.0
        view.addSubview(playlistCover)
        
        // playlist title
        playlistTitle = UILabel(frame: .zero)
        playlistTitle.translatesAutoresizingMaskIntoConstraints = false
        playlistTitle.text = "My Portfolio"
        playlistTitle.textColor = UIColor(named: "LabelTextColor")
        playlistTitle.textAlignment = .center
        let playlistTitleSize = view.frame.size.height * 0.033
        playlistTitle.font = UIFont.systemFont(ofSize: playlistTitleSize, weight: .bold)
        playlistTitle.alpha = 0.0
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
        playlistDesc.alpha = 0.0
        view.addSubview(playlistDesc)
        
        // play button
        playButton = UIButton(frame: .zero)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setBackgroundImage(UIImage(named: "play_button"), for: .normal)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        playButton.alpha = 0.0
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
        coverTopPadding = view.frame.size.height * 0.15 + 10.0
        titleTopPadding = view.frame.size.height * 0.03
        descTopPadding = view.frame.size.height * 0.02
        playButtonTopPadding = view.frame.size.height * 0.15 - 10.0
        setVerticalConstraint()
        
        view.layoutSubviews()
        
        animateViewsIn()
        
    }
    
    func setVerticalConstraint() {
        if let _ = verticalConstraint {
            view.removeConstraints(verticalConstraint)
        }
        
        verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(coverTop)-[cover]-(titleTop)-[title]-(descTop)-[desc]-(playTop)-[play]", options: [], metrics: ["coverTop": coverTopPadding!, "titleTop": titleTopPadding!, "descTop": descTopPadding!, "playTop": playButtonTopPadding!], views: ["play": playButton!, "desc": playlistDesc!, "title": playlistTitle!, "cover": playlistCover!])
        view.addConstraints(verticalConstraint)
    }
    
    func animateViewsIn() {
        if playlistCover.alpha == 0.0 {
            // rotate blob
            for (i, blob) in blobs.enumerated() {
                rotateBlob(i: i, blob: blob)
            }
            
            // fade in avatar and titles
            coverTopPadding -= 10.0
            playButtonTopPadding += 10.0
            setVerticalConstraint()
            
            UIView.animate(withDuration: 0.5, delay: 1.0) {
                self.playlistCover.alpha = 1.0
                self.playlistTitle.alpha = 1.0
                self.playlistDesc.alpha = 1.0
                
                for blob in self.blobs {
                    blob.alpha = CGFloat.random(in: 0.4...0.6)
                }
                
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.playButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                self.playButton.alpha = 1.0
                
                UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut) {
                    self.playButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                } completion: { _ in
                    UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveEaseInOut) {
                        self.playButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }
                }
            }
        }
    }
    
    func animateViewsOut(completionHandler: @escaping () -> Void) {
        // fade in avatar and titles
        coverTopPadding += 10.0
        playButtonTopPadding -= 10.0
        setVerticalConstraint()
        
        UIView.animate(withDuration: 0.5) {
            self.playlistCover.alpha = 0.0
            self.playlistTitle.alpha = 0.0
            self.playlistDesc.alpha = 0.0
            
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveEaseInOut) {
                self.playButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            } completion: { _ in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut) {
                    self.playButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                } completion: { _ in
                    self.playButton.alpha = 0.0
                    
                    UIView.animate(withDuration: 0.5) {
                        for blob in self.blobs {
                            blob.alpha = 0.0
                        }
                    } completion: { _ in
                        completionHandler()
                    }
                }
            }
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
        animateViewsOut {
            self.navigationController?.pushViewController(ProjectViewController(), animated: false)
        }
    }
}

