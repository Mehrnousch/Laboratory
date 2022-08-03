


//  ExperimentDescriptionTableViewCell.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 13.07.22.
//

import Foundation
import UIKit
import SwiftUI

class ExperimentDescriptionTableViewCell : UITableViewCell {
    private lazy var container = UIView().autoLayoutView()
    private lazy var experimentSummaryText = UILabel().autoLayoutView()
    override init(style: ExperimentsListTableViewCell.CellStyle, reuseIdentifier: String?) {
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
extension ExperimentDescriptionTableViewCell {
    
    func setupCell (text: String) {
        experimentSummaryText.text = text
    }
}

// MARK: - SetupDefault

extension ExperimentDescriptionTableViewCell {
    func setupDefault() {
    }
}

// MARK: - SetupUI
extension ExperimentDescriptionTableViewCell {
    func setupUI() {
        backgroundColor = UIColor.systemBackground
        contentView.addSubview(container)
        container.addSubview(experimentSummaryText)
        experimentSummaryText.numberOfLines = 0
        
        
        //container
        container.backgroundColor = UIColor.secondarySystemBackground
        container.layer.cornerRadius = 10
        
        
        //experimentSummary
        experimentSummaryText.translatesAutoresizingMaskIntoConstraints = false
        experimentSummaryText.textColor = .label
        experimentSummaryText.font = UIFont(name:"HelveticaNeue", size: 10)
        experimentSummaryText.textAlignment = NSTextAlignment.natural
    }
    
    private func setupLayout() {
        //container
        container.heightAnchor.constraint(equalToConstant: 130).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        //experimentNameLabel
        experimentSummaryText.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        experimentSummaryText.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        experimentSummaryText.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        experimentSummaryText.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

