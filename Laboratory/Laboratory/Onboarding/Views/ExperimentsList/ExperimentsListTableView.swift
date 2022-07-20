//
//  ExperimentsListTableView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//

import Foundation
import UIKit

class ExperimentsListTableView: UIView {
    
    public enum Event{
        case askExperimentDetail(experiment: ExperimentDetails)
    }
    
    public var eventHandler: ((Event) -> Void)?
    
    
    private lazy var tableView = UITableView().autoLayoutView()
    private lazy var tableBackgroundView = TableBackgroundView()
    let experimentsList = [
        ExperimentDetails(expermintId: 232, experimentName: "azmayesh 1", experimentLabor: "Mechanical testing",experimentDate:"02.05.2022", text: [text1, text2, text3]),
        ExperimentDetails(expermintId: 213, experimentName: "azmayesh 2", experimentLabor: "Chemical  Lab", experimentDate: "03.05.2022", text: [text1, text4, text5, text6]),
        ExperimentDetails(expermintId: 532, experimentName: "azmayesh 3", experimentLabor: "Biolab", experimentDate: "04.05.2022", text: [text7, text8, text9])
    ]
    
    
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

// MARK: - TableView Delegate
extension ExperimentsListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let numberOfSelectedCell = indexPath.row
        let details = experimentsList[numberOfSelectedCell]
        eventHandler?(.askExperimentDetail(experiment: details ))
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
        tableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
    }
}

