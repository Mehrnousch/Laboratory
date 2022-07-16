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
    private lazy var experimentsListTableView = ExperimentsListTableView().autoLayoutView()

    public enum Event {
        case newExperiment
        
    }
 
    public var eventHandler: ((Event) -> Void)?
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
         eventHandler = { [weak self] events in
             switch events {
             case .newExperiment:
                 self?.experimentDetail()
             }
         }
        experimentsListTableView.eventHandler = { [weak self] events in
            switch events {
            case .numberOfSelectedCell(let numberOfSelectedCell):
                print("number of selected Cell is: \(numberOfSelectedCell)")
            
            }
        }
     }
}


// MARK: - API call

extension DashboardViewController {
    
   /* private func fetchShorterLink(url: String) {
        Task {
            do {
                let shorterLink = try await NetworkingModel.shared.fetchAlbumWithAsyncURLSession(for: url)
                    experimentsListTableView.experimentsList.append(shorterLink)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }pp*/
    private func experimentDetail(){
           print("Experiment Details")
        
    }
}

//MARK: -New Experiment Button
extension DashboardViewController {
/*    @objc func pressed() {
        let url = "http://apple.com"
            eventHandler?(.shortLink(url: url))
    }pp*/
    @objc func pressed() {
           
        eventHandler?(.newExperiment)
        }
    
}

//MARK: -Setup
extension DashboardViewController {
    
    func setupDefault() {
    }
     
    override func setupUI() {
        title = "Experiments"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [newExperimentButton]
        newExperimentButton.image = UIImage(systemName: "plus")
        newExperimentButton.target = self
        newExperimentButton.style = .plain
        newExperimentButton.action = #selector(pressed)
        view.addSubview(experimentsListTableView)
        view.backgroundColor = .secondarySystemBackground
        experimentsListTableView.backgroundColor = .secondarySystemBackground
    }
    
    override func setupLayout() {
    //LinkTableViewCell
    experimentsListTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
    experimentsListTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    experimentsListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
}
}

