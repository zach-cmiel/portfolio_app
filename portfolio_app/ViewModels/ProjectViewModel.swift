//
//  ProjectViewModel.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/11/21.
//

import UIKit

class ProjectViewModel: ObservableObject {
    
    // project arrays
    private var projectCovers: [String] = ["makeArt",
                                           "relativity",
                                           "soundtrack",
                                           "studio",
                                           "peckapp",
                                           "matrix",
                                           "current",
                                           "discover"]
    
    private var projectFullDescs: [String] = ["Since July 2019 I've written all of the code for makeArt. We use ARKit, Vision framework, CoreML, and built in gestures to help users create AI assisted generative art. I used Swift and Firebase to grow this app to 7,000+ users",
                                              "I've spent the past 2 summers at Relativity, first on the Data Grid team and second on the Review/Core team. I've used .NET and C# to perform API Governance on several internal and external APIs along with writing a file validator for the document viewer application.",
                                              "For the past year or so, I've been very interested in data journalism and have tried my hand at 2 visual essays. Using Python for data collection/analysis and React JS for web development, I took advantage of the Spotify API and my own music library to explore what the Indie genre really means and what echo chambers are in music.",
                                              "This is my personal studio Instagram account. It generally serves as a log for all of my creative work whether that be coding, graphic design, animation, or even cooking. I like to log my work to keep track of progress and create a running portfolio for myself as I learn new skills.",
                                              "From 2018 to 2020, I was the CTO of a startup I started with 2 others called PeckApp. The premise was to make contact sharing easier. We received a grant from Providence College and got into Chicago's incubator, 1871 to develop the idea. I wrote all of the code using Swift, Node JS, and Firebase to support our 2000+ users. We were forced to shut down due to Covid however were in the process of hosting Providence's largest job fair where the app supported hundreds of students and companies.",
                                              "During the summer of 2019, I interned as a frontend web developer at Matrix Executions. Throughout the internship I was responsible for refactoring the CSS of their client application. This involved learning and becoming comfortable changing a million plus line codebase to reflect updated design standards provided to me.",
                                              "Throughout high school (2014-2018) I interned at Current 3 times as an iOS developer, product designer, and then iOS developer again. Here I learned the foundations of iOS development and what makes a good product. I had my first exposure to Git and working on a team along with how to work between a development and design team.",
                                              "Discover was the first app I created after experimenting with different 2d games using SpriteKit. I utilized the Spotify API to create an interface for the top tracks/artists and seed recommendation endpoints. In the app, users could login to their Spotify and browse their library. Clicking a track would give them song and artist recommendations. 5000+ users signed up before I stopped working on it."]
    private var projectTextColors: [UIColor] = [UIColor.white,
                                                UIColor.black,
                                                UIColor.black,
                                                UIColor.black,
                                                UIColor.black,
                                                UIColor.black,
                                                UIColor.white,
                                                UIColor.white]
    
    private var projectNames: [String] = ["makeArt",
                                          "Relativity",
                                          "The Soundtrack",
                                          "zachcmiel.studio",
                                          "PeckApp",
                                          "Matrix Executions",
                                          "Current",
                                          "Discover"]
    private var projectDescs: [String] = ["Lead of Tech and Development",
                                          "Software Engineering Intern",
                                          "Visual Data Essays",
                                          "My Instagram Studio",
                                          "CTO",
                                          "Frontend Web Development Intern",
                                          "iOS Development and Design Intern",
                                          "Creator"]
    private var startDates: [String] = ["Summer 2019",
                                        "2020",
                                        "2019",
                                        "2019",
                                        "2018",
                                        "June 2019",
                                        "2014",
                                        "2016"]
    private var endDates: [String] = ["Present",
                                      "2021",
                                      "Present",
                                      "Present",
                                      "2020",
                                      "September 2019",
                                      "2018",
                                      "2016"]
    
    func getProjectCount() -> Int {
        return projectNames.count
    }
    
    func getProjectName(i: Int) -> String {
        return projectNames[i]
    }
    
    func getProjectDesc(i: Int) -> String {
        return projectDescs[i]
    }
    
    func getStartDates(i: Int) -> String {
        return startDates[i]
    }
    
    func getEndDates(i: Int) -> String {
        return endDates[i]
    }
    
    func getProjectImage(i: Int) -> UIImage {
        return UIImage(named: "\(projectCovers[i])_cover")!
    }
    
    func getProjectFullDesc(i: Int) -> String {
        return projectFullDescs[i]
    }
    
    func getProjectBgImage(i: Int) -> UIImage {
        return UIImage(named: "\(projectCovers[i])_bg")!
    }
    
    func getProjectTextColor(i: Int) -> UIColor {
        return projectTextColors[i]
    }
}
