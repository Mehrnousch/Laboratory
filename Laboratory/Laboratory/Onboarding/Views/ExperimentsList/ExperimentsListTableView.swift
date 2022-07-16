//
//  ExperimentsView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//

import Foundation
import UIKit

class ExperimentsListTableView: UIView {
    private lazy var tableView = UITableView().autoLayoutView()
    private lazy var tableBackgroundView = TableBackgroundView()
    let experimentsList = [
        ExperimentDetails(name: "azmayesh 1", person: "Mehrnoush",experimentDate:"02.05.2022"),
        ExperimentDetails(name: "azmayesh 2", person: "Shadi", experimentDate: "03.05.2022"),
        ExperimentDetails(name: "azmayesh 3", person: "Shaghayegh", experimentDate: "04.05.2022")
    ]
    
    public var eventHandler: ((Event) -> Void)?
    public enum Event{
        case numberOfSelectedCell(numberOfSelrctedCell: Int)
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

extension ExperimentsListTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
                       let experimentData = experimentsList[indexPath.row]
                       cell.setupCell(data: experimentData)
                       cell.selectionStyle = .none
        
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableView data source
extension ExperimentsListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let numberOfSelectedCell = indexPath.row
        eventHandler?(.numberOfSelectedCell(numberOfSelrctedCell: numberOfSelectedCell))
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
// MARK: - Setup UI
extension ExperimentsListTableView {
    
    func setupDefault() {
        tableView.register(ExperimentsListTableViewCell.self, forCellReuseIdentifier: "linkCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupUI() {
        addSubview(tableView)
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

