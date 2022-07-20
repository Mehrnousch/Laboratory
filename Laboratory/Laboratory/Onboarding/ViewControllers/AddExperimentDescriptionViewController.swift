
//
//  AddExperimentDescriptionViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//


import Foundation
import SwiftFoundation
import UIKit

class AddExperimentDescriptionViewController: UIViewController {
    private lazy var tableBackgroundView = TableBackgroundView()
    private lazy var container = UIView().autoLayoutView()
    private lazy var tableView = UITableView().autoLayoutView()
    private var experimentDetails: ExperimentDetails
    
    init(experimentDetails : ExperimentDetails) {
        self.experimentDetails = experimentDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
}
// MARK: - TableView Data source

extension AddExperimentDescriptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if experimentDetails.text.isEmpty {
            tableView.backgroundView = tableBackgroundView
            tableView.separatorStyle  = .none
            return 0
        }
        else {
            tableView.backgroundView  = .none
            return experimentDetails.text.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? AddExperimentDescriptionTableViewCell {
            let text = experimentDetails.text[indexPath.row]
            cell.setupCell(text: text)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - Setup UI
extension AddExperimentDescriptionViewController {
    
    func setupDefault() {
        tableView.register(AddExperimentDescriptionTableViewCell.self, forCellReuseIdentifier: "summaryCell")
        tableView.dataSource = self
        
    }
    
    func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        title = experimentDetails.experimentName
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        tableBackgroundView.backgroundColor = .systemBackground
        
        // print(experimentDescriptions)
    }
    
    func setupLayout() {
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        //tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        
        
        
    }
}


