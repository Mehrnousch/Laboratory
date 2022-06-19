//
//  DashboardViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import SwiftFoundation
import UIKit

class DashboardViewController: ViewController {
    
    private lazy var newExperimentButton = UIBarButtonItem()
}

// MARK: - Defaults

extension DashboardViewController {
    
    override func setupUI() {
        title = "Experiments"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItems = [newExperimentButton]
        
        newExperimentButton.image = UIImage(systemName: "plus")
    }
}
