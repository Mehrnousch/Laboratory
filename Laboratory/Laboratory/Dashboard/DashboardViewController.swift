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
    private lazy var experimentTableView = ExperimentTableView().autoLayoutView()
    private lazy var  experimentTableViewCell = ExperimentsListTableViewCell().autoLayoutView()
    public enum Event {
        case shortLink(url: String)
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
            case .shortLink(let url):
             
                self?.fetchShorterLink(url: url)
            }
        }
    }
}

// MARK: - API call

extension DashboardViewController {
    
    private func fetchShorterLink(url: String) {
        Task {
            do {
                let shorterLink = try await NetworkingModel.shared.fetchAlbumWithAsyncURLSession(for: url)
                    experimentTableView.experimentsList.append(shorterLink)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}


//MARK: -New Experiment Button
extension DashboardViewController {
    @objc func pressed() {
        let url = "http://apple.com"
            eventHandler?(.shortLink(url: url))
    }
}




//MARK: -Setup
extension DashboardViewController {
    
    func setupDefault() {
     
    }
    internal override func setupUI() {
        title = "Experiments"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [newExperimentButton]
        newExperimentButton.image = UIImage(systemName: "plus")
        newExperimentButton.target = self
        newExperimentButton.style = .plain
        newExperimentButton.action = #selector(pressed)
        view.addSubview(experimentTableView)
        view.backgroundColor = .secondarySystemBackground
        experimentTableView.backgroundColor = .secondarySystemBackground
    }
    
    internal override func setupLayout() {
    
    //LinkTableViewCell
    experimentTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
    experimentTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    experimentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
}
}


