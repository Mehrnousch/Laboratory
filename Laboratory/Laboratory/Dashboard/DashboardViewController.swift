//
//  DashboardViewController.swift
//  List of reserved tests
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import SwiftFoundation
import UIKit

class DashboardViewController: UIViewController {
    
    private lazy var newExperimentButton = UIBarButtonItem()
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
                let vc = ExperimentDescriptionViewController(experimentDetails: details)
                self?.navigationController?.pushViewController(vc, animated: true)
            
            }
        }
     }
}
//MARK: -Button
extension DashboardViewController {
    
    @objc func pressed(sender: UIBarButtonItem) {
        let vc = SelectLaboratory()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -Setup
extension DashboardViewController {
    
    func setupDefaults() {
    }
     
    private func setupUI() {
        title = "Experiments"
        navigationController?.navigationBar.prefersLargeTitles = true
       navigationItem.rightBarButtonItems = [newExperimentButton]
        newExperimentButton.image = UIImage(systemName: "plus")
        newExperimentButton.style = .plain
        newExperimentButton.target = self
        newExperimentButton.action = #selector(pressed(sender:))
        view.addSubview(experimentsListTableView)
        view.backgroundColor = .secondarySystemBackground
        //newExperimentButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
       
    }
    
    private func setupLayout() {
    //LinkTableViewCell
    experimentsListTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        experimentsListTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    experimentsListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
}
}

