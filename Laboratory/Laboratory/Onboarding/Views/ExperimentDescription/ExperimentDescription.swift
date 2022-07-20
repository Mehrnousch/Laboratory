//
//  ExperimentDescription.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 19.07.22.
//


import Foundation
import UIKit

class ExperimentDescription: UIViewController {
    
    private lazy var experimentDescriptionTextView = UITextView().autoLayoutView()
    private var experimentDetails: ExperimentDetails
    
    init(experimentDetails : ExperimentDetails) {
        self.experimentDetails = experimentDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Setup Default

extension ExperimentDescription {
    
    func setupDefault() {
        
    }
}
// MARK: - Setup UI

extension ExperimentDescription {
    func setupUI() {
        view.addSubviews(experimentDescriptionTextView)
        experimentDescriptionTextView.backgroundColor = .systemBackground
        experimentDescriptionTextView.textColor = .label
        experimentDescriptionTextView.layer.cornerRadius = 10
        experimentDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Layout

extension ExperimentDescription {
    private func setupLayout() {
        experimentDescriptionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        experimentDescriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        experimentDescriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        experimentDescriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
}

