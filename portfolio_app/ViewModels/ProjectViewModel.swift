//
//  ProjectViewModel.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/11/21.
//

import UIKit

class ProjectViewModel: ObservableObject {
    
    // project arrays
    private var projectCovers: [String] = ["makeArt", "relativity", "soundtrack", "studio", "peckapp", "matrix", "current", "discover"]
    private var projectNames: [String] = ["makeArt", "Relativity", "The Soundtrack", "zachcmiel.studio", "PeckApp", "Matrix Executions", "Current", "Discover"]
    private var projectDescs: [String] = ["Lead of Tech and Development", "Software Engineering Intern", "Visual Data Essays", "My Instagram Studio", "CTO", "Frontend Web Development Intern", "iOS Development and Design Intern", "Creator"]
    private var startDates: [String] = ["Summer 2019", "2020", "2019", "2019", "2018", "June 2019", "2014", "2016"]
    private var endDates: [String] = ["Present", "2021", "Present", "Present", "2020", "September 2019", "2018", "2016"]
    
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
}
