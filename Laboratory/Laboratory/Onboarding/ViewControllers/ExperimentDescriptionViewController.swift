
//
//  AddExperimentDescriptionViewController.swift
//  The user can describe the experiment performed.
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//


import Foundation
import UIKit

class ExperimentDescriptionViewController: UIViewController {
    
    private lazy var AddNewDescriptionButton = UIBarButtonItem()
    private lazy var tableBackgroundView = TableBackgroundView()
    private lazy var container = UIView().autoLayoutView()
    private lazy var tableView = UITableView().autoLayoutView()
    public var eventHandler: ((Event) -> Void)?
    public enum Event{
       case askAllDescriptionText(text: String)
    }
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
        eventHandlers()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
}
//MARK: -Button
extension ExperimentDescriptionViewController {
    
    @objc func pressed(sender: UIBarButtonItem) {
        let vc = AddExperimentDescription()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Handlers

extension ExperimentDescriptionViewController {
    
    private func eventHandlers() {
        eventHandler = { [weak self] events in
            switch events {
            case .askAllDescriptionText(let text):
                let vc = ViewFullDescriptionViewController(text : text)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
     }
}
// MARK: - TableView Data source

extension ExperimentDescriptionViewController: UITableViewDataSource {
    
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
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as? ExperimentDescriptionTableViewCell {
            let text = experimentDetails.text[indexPath.row]
            cell.setupCell(text: text)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
// MARK: - TableView Delegate
extension ExperimentDescriptionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let numberOfSelectedCell = indexPath.row
        let text = experimentDetails.text[numberOfSelectedCell]
        eventHandler?(.askAllDescriptionText(text: text))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Setup UI
extension ExperimentDescriptionViewController {
    
    func setupDefault() {
        tableView.register(ExperimentDescriptionTableViewCell.self, forCellReuseIdentifier: "summaryCell")
        tableView.dataSource = self
        tableView.delegate = self
        AddNewDescriptionButton.image = UIImage(systemName: "plus")
        AddNewDescriptionButton.style = .plain
        AddNewDescriptionButton.target = self
        AddNewDescriptionButton.action = #selector(pressed(sender:))

    }
    
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
       navigationItem.rightBarButtonItems = [AddNewDescriptionButton]
        view.backgroundColor = .secondarySystemBackground
        view.backgroundColor = .secondarySystemBackground
        title = experimentDetails.experimentName
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableBackgroundView.backgroundColor = .systemBackground
        
    }
    
    func setupLayout() {
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        //tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        
        
        
    }
}


