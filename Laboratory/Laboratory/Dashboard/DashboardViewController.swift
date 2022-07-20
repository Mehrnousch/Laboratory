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
    
    //private lazy var newExperimentButton = UIBarButtonItem()
    private lazy var experimentsListTableView = ExperimentsListTableView().autoLayoutView()
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandlers()
        setupDefaults()
        setupUI()
        setupLayout()
    }
}

// MARK: - Handlers

extension DashboardViewController {
    
    private func eventHandlers() {
        experimentsListTableView.eventHandler = { [weak self] events in
            switch events {
            case .askExperimentDetail(let details):
                let vc = AddExperimentDescriptionViewController(experimentDetails: details)
                self?.navigationController?.pushViewController(vc, animated: true)
            
            }
        }
     }
}


//MARK: -Setup
extension DashboardViewController {
    
    func setupDefault() {
    }
     
    override func setupUI() {
        title = "Experiments"
       // navigationController?.navigationBar.prefersLargeTitles = true
       // navigationItem.rightBarButtonItems = [newExperimentButton]
       // newExperimentButton.image = UIImage(systemName: "plus")
        //newExperimentButton.style = .plain
        view.addSubview(experimentsListTableView)
        view.backgroundColor = .secondarySystemBackground
    }
    
    override func setupLayout() {
    //LinkTableViewCell
    experimentsListTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        experimentsListTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    experimentsListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
}
}

