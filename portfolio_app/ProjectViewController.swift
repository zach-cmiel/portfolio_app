//
//  ProjectViewController.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/9/21.
//

import UIKit

class ProjectViewController: UIViewController {
    
    // views
    private var playlistTitle: UILabel!
    var albumCovers: UICollectionView!
    private var songTitle: UILabel!
    private var songDesc: UILabel!
    private var progressBar: UIView!
    private var startDate: UILabel!
    private var endDate: UILabel!
    private var previousButton: UIButton!
    private var nextButton: UIButton!
    private var backButton: UIButton!
    
    // vertical constraint
    private var playlistTitlePadding: CGFloat!
    private var albumTopPadding: CGFloat!
    private var songPadding: CGFloat!
    private var descPadding: CGFloat!
    private var progressPadding: CGFloat!
    private var controlsPadding: CGFloat!
    private var datePadding: CGFloat!
    private var verticalConstraint: [NSLayoutConstraint]!
    
    // view model
    var viewModel: ProjectViewModel = ProjectViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // background color
        view.backgroundColor = .systemBackground
        
        // set up views
        setUpViews()
    }
    
    // set up views
    func setUpViews() {
        // playlist title
        playlistTitle = UILabel(frame: .zero)
        playlistTitle.translatesAutoresizingMaskIntoConstraints = false
        playlistTitle.text = "My Portfolio"
        playlistTitle.textColor = .label
        playlistTitle.textAlignment = .center
        let playlistTitleSize = view.frame.size.height * 0.018
        playlistTitle.font = UIFont.systemFont(ofSize: playlistTitleSize, weight: .regular)
        playlistTitle.alpha = 0.0
        view.addSubview(playlistTitle)
        
        // collection view layout
        let cellSize = view.frame.size.width * 0.88405797
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width, height: cellSize)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        // collection view
        albumCovers = UICollectionView(frame: .zero, collectionViewLayout: layout)
        albumCovers.translatesAutoresizingMaskIntoConstraints = false
        albumCovers.delegate = self
        albumCovers.dataSource = self
        albumCovers.backgroundColor = .clear
        albumCovers.isPagingEnabled = true
        albumCovers.showsHorizontalScrollIndicator = false
        albumCovers.showsVerticalScrollIndicator = false
        albumCovers.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: "cover")
        albumCovers.alpha = 0.0
        view.addSubview(albumCovers)
        
        // song title
        songTitle = UILabel(frame: .zero)
        songTitle.translatesAutoresizingMaskIntoConstraints = false
        songTitle.text = self.viewModel.getProjectName(i: 0)
        songTitle.textColor = UIColor(named: "LabelTextColor")
        let songLabelSize = view.frame.size.height * 0.025
        songTitle.font = UIFont.systemFont(ofSize: songLabelSize, weight: .bold)
        songTitle.alpha = 0.0
        view.addSubview(songTitle)
        
        // song desc
        songDesc = UILabel(frame: .zero)
        songDesc.translatesAutoresizingMaskIntoConstraints = false
        songDesc.text = self.viewModel.getProjectDesc(i: 0)
        songDesc.textColor = UIColor(named: "LabelTextColor")
        songDesc.font = UIFont.systemFont(ofSize: songLabelSize, weight: .regular)
        songDesc.alpha = 0.0
        view.addSubview(songDesc)
        
        // progress bar (update corner radius after constraints
        progressBar = UIView(frame: .zero)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = UIColor(named: "LabelTextColor")
        progressBar.alpha = 0.0
        view.addSubview(progressBar)
        
        // start date
        startDate = UILabel(frame: .zero)
        startDate.translatesAutoresizingMaskIntoConstraints = false
        startDate.text = self.viewModel.getStartDates(i: 0)
        startDate.textColor = UIColor(named: "LabelTextColor")
        startDate.textAlignment = .left
        let dateSize = view.frame.size.height * 0.017
        startDate.font = UIFont.systemFont(ofSize: dateSize, weight: .regular)
        startDate.alpha = 0.0
        view.addSubview(startDate)
        
        // end date
        endDate = UILabel(frame: .zero)
        endDate.translatesAutoresizingMaskIntoConstraints = false
        endDate.text = self.viewModel.getEndDates(i: 0)
        endDate.textColor = UIColor(named: "LabelTextColor")
        endDate.textAlignment = .right
        endDate.font = UIFont.systemFont(ofSize: dateSize, weight: .regular)
        endDate.alpha = 0.0
        view.addSubview(endDate)
        
        // back button (goes back to first vc)
        backButton = UIButton(frame: .zero)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setBackgroundImage(UIImage(named: "playlist_cover"), for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.alpha = 0.0
        view.addSubview(backButton)
        
        // previous button
        previousButton = UIButton(frame: .zero)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.setBackgroundImage(UIImage(named: "previous_button")?.withRenderingMode(.alwaysTemplate), for: .normal)
        previousButton.tintColor = UIColor(named: "LabelTextColor")
        previousButton.addTarget(self, action: #selector(previousProject), for: .touchUpInside)
        previousButton.alpha = 0.0
        view.addSubview(previousButton)
        
        // next button
        nextButton = UIButton(frame: .zero)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setBackgroundImage(UIImage(named: "next_button")?.withRenderingMode(.alwaysTemplate), for: .normal)
        nextButton.tintColor = UIColor(named: "LabelTextColor")
        nextButton.addTarget(self, action: #selector(nextProject), for: .touchUpInside)
        nextButton.alpha = 0.0
        view.addSubview(nextButton)
        
        // set up constraints
        setUpConstraints()
    }
    
    // set up constraints
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            playlistTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumCovers.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            albumCovers.widthAnchor.constraint(equalTo: view.widthAnchor),
            albumCovers.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88405797),
            progressBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88405797),
            progressBar.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        NSLayoutConstraint.activate([
            songTitle.leftAnchor.constraint(equalTo: progressBar.leftAnchor),
            songDesc.leftAnchor.constraint(equalTo: songTitle.leftAnchor),
            startDate.leftAnchor.constraint(equalTo: progressBar.leftAnchor),
            endDate.rightAnchor.constraint(equalTo: progressBar.rightAnchor),
            endDate.centerYAnchor.constraint(equalTo: startDate.centerYAnchor),
            previousButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            nextButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            previousButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.058),
            previousButton.heightAnchor.constraint(equalTo: previousButton.widthAnchor),
            nextButton.widthAnchor.constraint(equalTo: previousButton.widthAnchor),
            nextButton.heightAnchor.constraint(equalTo: previousButton.heightAnchor)
        ])
        
        // rest of the y positions
        playlistTitlePadding = view.frame.size.height * 0.049125 + 44.0
        albumTopPadding = view.frame.size.height * 0.05125
        songPadding = view.frame.size.height * 0.0274107
        descPadding = view.frame.size.height * 0.00874107
        progressPadding = view.frame.size.height * 0.0332143
        datePadding = view.frame.size.height * 0.00892857
        controlsPadding = view.frame.size.height * 0.0332143
        setVerticalConstraint()
        
        // controls x
        let controlsPadding = view.frame.size.width * 0.083
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[prev]-(pad)-[back]-(pad)-[next]", options: [], metrics: ["pad": controlsPadding], views: ["prev": previousButton!, "back": backButton!, "next": nextButton!]))
        
        // update layout and then add corner radius to progress bar
        view.layoutIfNeeded()
        progressBar.layer.cornerRadius = progressBar.frame.size.height * 0.5
        
        view.layoutSubviews()
        
        animateViewsIn()
    }
    
    func setVerticalConstraint() {
        if let _ = verticalConstraint {
            view.removeConstraints(verticalConstraint)
        }
        
        verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(titlePad)-[title]-(coverPad)-[covers]-(songPad)-[songTitle]-(descPad)-[songDesc]-(progControl)-[bar]-(datePad)-[date]-(controlPad)-[back]", options: [], metrics: ["titlePad": playlistTitlePadding!, "coverPad": albumTopPadding!, "songPad": songPadding!, "descPad": descPadding!, "progControl": progressPadding!, "datePad": datePadding!, "controlPad": controlsPadding!], views: ["title": playlistTitle!, "covers": albumCovers!, "songTitle": songTitle!, "songDesc": songDesc!, "bar": progressBar!, "date": startDate!, "back": backButton!])
        view.addConstraints(verticalConstraint)
    }
    
    func animateViewsIn() {
        // fade in avatar and titles
        playlistTitlePadding -= 10.0
        controlsPadding += 10.0
        setVerticalConstraint()
        
        UIView.animate(withDuration: 0.5, delay: 1.0) {
            self.playlistTitle.alpha = 1.0
            self.albumCovers.alpha = 1.0
            self.songTitle.alpha = 1.0
            self.songDesc.alpha = 1.0
            self.progressBar.alpha = 1.0
            self.startDate.alpha = 1.0
            self.endDate.alpha = 1.0
            
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.previousButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            self.previousButton.alpha = 1.0
            
            self.nextButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            self.nextButton.alpha = 1.0
            
            self.backButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            self.backButton.alpha = 1.0
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut) {
                self.previousButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.nextButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.backButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            } completion: { _ in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveEaseInOut) {
                    self.previousButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.nextButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.backButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
        }
    }
    
    func animateViewsOut(completionHandler: @escaping () -> Void) {
        // fade in avatar and titles
        playlistTitlePadding += 10.0
        controlsPadding -= 10.0
        setVerticalConstraint()
        
        UIView.animate(withDuration: 0.5) {
            self.playlistTitle.alpha = 0.0
            self.albumCovers.alpha = 0.0
            self.songTitle.alpha = 0.0
            self.songDesc.alpha = 0.0
            self.progressBar.alpha = 0.0
            self.startDate.alpha = 0.0
            self.endDate.alpha = 0.0
            
            self.view.layoutIfNeeded()
        } completion: { _ in            
            UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveEaseInOut) {
                self.previousButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.nextButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.backButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            } completion: { _ in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut) {
                    self.previousButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                    self.nextButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                    self.backButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                } completion: { _ in
                    self.previousButton.alpha = 0.0
                    self.nextButton.alpha = 0.0
                    self.backButton.alpha = 0.0
                    
                    completionHandler()
                }
            }
        }
    }
    
    func updateTitles(i: Int) {
        songTitle.text = self.viewModel.getProjectName(i: i)
        songDesc.text = self.viewModel.getProjectDesc(i: i)
        startDate.text = self.viewModel.getStartDates(i: i)
        endDate.text = self.viewModel.getEndDates(i: i)
    }
    
    @objc func back() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        // pop to playlist vc
        animateViewsOut {
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
    
    @objc func previousProject() {
        // go to current cell - 1
        let currentCell = getCurrentCell()
        
        if currentCell.item > 0 {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
            let previousCell = IndexPath(item: currentCell.item - 1, section: currentCell.section)
            self.albumCovers.scrollToItem(at: previousCell, at: .centeredHorizontally, animated: true)
            
            updateTitles(i: previousCell.item)
        }
    }
    
    @objc func nextProject() {
        // go to current cell + 1
        let currentCell = getCurrentCell()
        
        if currentCell.item < self.viewModel.getProjectCount() - 1 {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
            let nextCell = IndexPath(item: currentCell.item + 1, section: currentCell.section)
            self.albumCovers.scrollToItem(at: nextCell, at: .centeredHorizontally, animated: true)
            
            updateTitles(i: nextCell.item)
        }
    }
    
    func getCurrentCell() -> IndexPath {
        if albumCovers.visibleCells.count > 0 {
            let currentCell = albumCovers.visibleCells[0]
            let currentIndex = albumCovers.indexPath(for: currentCell)!
            
            return currentIndex
        }
        
        return IndexPath(item: 0, section: 0)
    }
}
