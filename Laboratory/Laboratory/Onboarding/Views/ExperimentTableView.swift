//
//  ExperimentsView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//

import Foundation
import UIKit

class ExperimentTableView: UIView {
    
    private lazy var tableView = UITableView().autoLayoutView()
    private lazy var tableBackgroundView = TableBackgroundView()
    
    var experimentsList: [ExperimentData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupDefault()
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - TableView Data source

extension ExperimentTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if experimentsList.isEmpty {
            tableView.backgroundView = tableBackgroundView
            tableView.separatorStyle  = .none
            return 0
        }
        else {
            tableView.backgroundView  = .none
            return experimentsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as? ExperimentsListTableViewCell {
            let linkData = experimentsList[indexPath.row]
            cell.setupCell(data: linkData)
            cell.selectionStyle = .none
           
            
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - Setup UI
extension ExperimentTableView {
    
    func setupDefault() {
        tableView.register(ExperimentsListTableViewCell.self, forCellReuseIdentifier: "linkCell")
        tableView.dataSource = self
        
        
    }
    
    func setupUI() {
        addSubview(tableView)
        addSubview(tableBackgroundView)
        tableView.backgroundColor = .systemBackground
        tableBackgroundView.backgroundColor = .systemBackground
    }
    
     private func setupLayout() {
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
     }
}

