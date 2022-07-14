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
    private lazy var addDescriptionButton = UIButton().autoLayoutView()
    private lazy var experimentDescription = ExperimentDescription()

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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as? AddExperimentDescriptionTableViewCell {
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
        tableView.register(AddExperimentDescriptionTableViewCell.self, forCellReuseIdentifier: "linkCell")
        tableView.dataSource = self
    }
    
    func setupUI() {
        addSubview(addDescriptionButton)
        addSubview(tableView)
        addSubview(descriptionTableViewBackground)
        tableView.backgroundColor = .systemBackground
        descriptionTableViewBackground.backgroundColor = .systemBackground
        
        //directionToDetail
        let image = UIImage(systemName: "doc.badge.plus" )
        addDescriptionButton.setImage(image, for: .normal)
        //addDescriptionButton1.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        addDescriptionButton.isEnabled = false
    }
    
     private func setupLayout() {
         tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.topAnchor.constraint(equalTo:addDescriptionButton.bottomAnchor, constant: 20).isActive = true
         tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
         
         //addDescriptionButton
         addDescriptionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         addDescriptionButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
         addDescriptionButton.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
         addDescriptionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
     }
}

