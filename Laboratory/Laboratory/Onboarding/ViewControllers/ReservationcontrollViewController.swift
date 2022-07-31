//
//  ReservationControll.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 31.07.22.
//

import Foundation
import Foundation
import SwiftFoundation
import UIKit

class ReservationViewControllerTableView: UIViewController {
    
    private lazy var label = UILabel().autoLayoutView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
}



// MARK: - Setup UI
extension ReservationViewControllerTableView {
    
    func setupDefault() {
       
    }
    
    func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        title = " Laboratory information"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true
        label.textColor = .label
        label.font = UIFont(name:"HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Please download and read the security information and laboratory protocols."
        label.backgroundColor = .secondarySystemBackground
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        
       

    }
    
    func setupLayout() {
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        
        
    }
}


