# Zach Cmiel's Portfolio

This is my iOS portfolio app! I created this to not only showcase my work experience and various projects I've worked on but also to have a sample app's 
sourcecode for people to view. I used Swift for the app. Following is a breakdown of the code.

## Interface
The interface is programatically created using `NSLayoutConstraints`. I've always found the programattic approach easier than AutoLayout because I think
of responsive interfaces in terms of percentages i.e. a view's x position should be 35% across the screen to the right or a subview's height should be 
75% of the superview's. The app is comprised of two screens. The first has a `UIImageView`, two `UILabels` and a `UIButton`. Also using duplicated
`UIImageViews` I created a wave animation by rotating them behind the button. The second screen mimics a music player interface using a paged `UICollectionView`.

## Code Architecture
In order to keep the code orderly I created an extensions file of the `ProjectViewController` (the second screen). This housed all of the `UICollectionView` data
source and delegate methods. This view controller's data was managed by a `ViewModel` that held multiple arrays of data. I used an MVVM architecture to organize
the files. I recognize this may have been overkill for such a simple app, but it turned out to be helpful in separating the arrays from the views. Because of the
simplicity, I combined the models (arrays) with the view model.

## Download
To download, use this Testflight link [https://testflight.apple.com/join/5u7Yg6Bp] or download the source code. Enjoy!
