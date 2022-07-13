//
//  AddDetail.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 13.07.22.
//


import Foundation
import UIKit

class AddExperimentDescriptionTableView: UIView {
    
    private lazy var tableView = UITableView().autoLayoutView()
    private lazy var descriptionTableViewBackground = DescriptionTableViewBackground()
    
   /* var experimentsList: [ExperimentData] = [] {
        didSet {
            tableView.reloadData()
        }
    }pp*/
   
    var experimentDescriptionList : [ExperimentDescription] = [] {
         didSet {
             tableView.reloadData()
         }}
    
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

extension AddExperimentDescriptionTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if experimentDescriptionList.isEmpty {
            tableView.backgroundView = descriptionTableViewBackground
            tableView.separatorStyle  = .none
            return 0
        }
        else {
            tableView.backgroundView  = .none
            return experimentDescriptionList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as? ExperimentDescriptionTableViewCell {
            let experimentDescription = experimentDescriptionList[indexPath.row]
            //cell.setupCell(data: linkData)
            cell.setupCell(data: experimentDescription)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - Setup UI
extension AddExperimentDescriptionTableView {
    
    func setupDefault() {
        tableView.register(ExperimentDescriptionTableViewCell.self, forCellReuseIdentifier: "linkCell")
        tableView.dataSource = self
    }
    
    func setupUI() {
        addSubview(tableView)
        addSubview(descriptionTableViewBackground)
        tableView.backgroundColor = .systemBackground
        descriptionTableViewBackground.backgroundColor = .systemBackground
    }
    
     private func setupLayout() {
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
     }
}

