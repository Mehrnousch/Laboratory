//
//  AddNewExperimentViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 21.07.22.
//

import Foundation
import UIKit

class AddNewExperimentViewController: UIViewController {
    
    private lazy var tableView = UITableView().autoLayoutView()
    private lazy var laborList = ["Labor1","Labor2","Labor3","Labor4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
}
// MARK: - TableView Data source

extension AddNewExperimentViewController: UITableViewDataSource {
   
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
       return laborList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "laborNameCell", for: indexPath) as? AddNewExperimentTableViewCell {
            let text = laborList[indexPath.row]
            cell.setupCell(text: text)
            return cell
            
        }
        return UITableViewCell()
    }
}
// MARK: - TableView Delegate
extension AddNewExperimentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = LaboratoryReservation()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Setup Default

extension AddNewExperimentViewController {
    func  setupDefault(){
        tableView.register(AddNewExperimentTableViewCell.self, forCellReuseIdentifier: "laborNameCell")
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
}
// MARK: - Setup UI

extension AddNewExperimentViewController {
    func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        title = "Liste der Labors"
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func setupLayout() {
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
}

}
