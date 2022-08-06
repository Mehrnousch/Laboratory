//
//  AddNewExperimentTableViewCell.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 21.07.22.
//


import Foundation
import UIKit
import SwiftUI

class SelectLaboratoryTableViewCell : UITableViewCell {
    
    private lazy var container = UIView().autoLayoutView()
    private lazy var laborNameLabel = UILabel().autoLayoutView()
    
    override init(style: SelectLaboratoryTableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - data setup cell
extension SelectLaboratoryTableViewCell {
    
    func setupCell (text: String) {
        laborNameLabel.text = text

    }
}

// MARK: - SetupDefault

extension SelectLaboratoryTableViewCell {
    func setupDefault() {
    }
}

// MARK: - SetupUI
extension SelectLaboratoryTableViewCell {
    func setupUI() {
        backgroundColor = UIColor.systemBackground
        contentView.addSubview(container)
        container.addSubview(laborNameLabel)
        laborNameLabel.numberOfLines = 0
        
        
        //container
        container.backgroundColor = UIColor.secondarySystemBackground
        container.layer.cornerRadius = 10
        
        
        //laborNameLabel
        laborNameLabel.translatesAutoresizingMaskIntoConstraints = false
        laborNameLabel.textColor = .label
        laborNameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
    }
    
    private func setupLayout() {
        //container
        container.heightAnchor.constraint(equalToConstant: 50).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        //laborNameLabel
        laborNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        laborNameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        laborNameLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        laborNameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

