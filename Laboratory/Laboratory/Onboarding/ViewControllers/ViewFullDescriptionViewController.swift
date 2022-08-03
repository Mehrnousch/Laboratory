//
//  ViewFullDescriptionViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 19.07.22.
//


import Foundation
import UIKit

class ViewFullDescriptionViewController: UIViewController {
    
    private lazy var experimentDescriptionTextView = UITextView().autoLayoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
  
     private var text : String
    
     init(text: String) {
         self.text = text
            super.init(nibName: nil, bundle: nil)
        }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}

// MARK: - SetupDefault
extension ViewFullDescriptionViewController {
    
    func setupDefault() {
    }
}
// MARK: - Setup UI
extension ViewFullDescriptionViewController {
    func setupUI() {
        view.addSubviews(experimentDescriptionTextView)
        view.backgroundColor = .secondarySystemBackground
        experimentDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        experimentDescriptionTextView.backgroundColor = .systemBackground
        experimentDescriptionTextView.textColor = .label
        experimentDescriptionTextView.font = UIFont(name:"HelveticaNeue", size: 14)
        experimentDescriptionTextView.layer.cornerRadius = 10
        experimentDescriptionTextView.text = text
    }
}

// MARK: - Setup Layout

extension ViewFullDescriptionViewController {
    private func setupLayout() {
        experimentDescriptionTextView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        experimentDescriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        experimentDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        experimentDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
    }
}

