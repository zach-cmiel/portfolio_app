//
//  ProjectViewModel.swift
//  portfolio_app
//
//  Created by Zach Cmiel on 7/11/21.
//

import UIKit

class ProjectViewModel: ObservableObject {
    
    // project arrays
    private var projectNames: [String] = ["makeArt", "PeckApp", "Current", "Discover"]
    private var projectDescs: [String] = ["makeArt", "PeckApp", "Current", "Discover"]
    private var startDates: [String] = ["makeArt", "PeckApp", "Current", "Discover"]
    private var endDates: [String] = ["makeArt", "PeckApp", "Current", "Discover"]
    
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
}
