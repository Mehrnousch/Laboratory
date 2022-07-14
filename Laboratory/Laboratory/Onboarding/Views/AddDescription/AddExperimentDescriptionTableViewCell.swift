//
//  AddDetailTableViewCell.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 13.07.22.
//


import Foundation
import UIKit

class AddExperimentDescriptionTableViewCell : UITableViewCell {
    
    public var eventHandler: ((Event) -> Void)?
    public enum Event {
        case removeItem(data: ExperimentDescription)
        
    }
    private lazy var container = UIView().autoLayoutView()
    private lazy var descriptionTitle = UILabel().autoLayoutView()
    private lazy var experimentTextDescription = UITextView().autoLayoutView()
    private lazy var experimentDescriptionImage1 = UIImageView().autoLayoutView()
    private lazy var experimentDescriptionImage2 = UIImageView().autoLayoutView()

    private lazy var experimentDescription = ExperimentDescription()


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
extension AddExperimentDescriptionTableViewCell {
    
    
    
    func setupCell(data: ExperimentDescription) {
        descriptionTitle.text = "Title"
        experimentTextDescription.text = "Experiment Description"
        experimentDescriptionImage1.image = UIImage(named: "no-URL")
        experimentDescriptionImage2.image = UIImage(named: "no-URL")

        experimentDescription = data
    }
}
//MARK: -directionToDetail
extension AddExperimentDescriptionTableViewCell {

    @objc func directionToDetailPressed() {
        eventHandler?(.removeItem(data: ExperimentDescription()))
    }
}
// MARK: - SetupDefault

extension AddExperimentDescriptionTableViewCell {
    
    
    func setupDefault() {}}


// MARK: - SetupUI

extension AddExperimentDescriptionTableViewCell {
    
    
    func setupUI() {
        backgroundColor = UIColor.systemBackground
        contentView.addSubview(container)
        container.addSubview(descriptionTitle)
        container.addSubview(experimentTextDescription)
 
        //container
        container.backgroundColor = UIColor.secondarySystemBackground
        container.layer.cornerRadius = 10
        
        //descriptionTitle
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.textColor = .label
        descriptionTitle.font = UIFont(name:"HelveticaNeue", size: 14)

        
        //experimentTextDescription
        experimentTextDescription.translatesAutoresizingMaskIntoConstraints = false
        experimentTextDescription.textColor = .label
        experimentTextDescription.font = UIFont(name:"HelveticaNeue-Bold", size: 20)

        
        
        
        
        
        
        
        
    }
    
    private func setupLayout() {
        
        //container
        container.heightAnchor.constraint(equalToConstant: 230).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        //descriptionTitle
        descriptionTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        descriptionTitle.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60).isActive = true
        descriptionTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        descriptionTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 25).isActive = true
        
    
        //experimentTextDescription
        experimentTextDescription.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        experimentTextDescription.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        experimentTextDescription.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 25).isActive = true
        
        experimentTextDescription.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //experimentDescriptionImage1
        experimentDescriptionImage1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        experimentDescriptionImage1.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6 ).isActive = true
      experimentDescriptionImage1.topAnchor.constraint(equalTo: experimentTextDescription.bottomAnchor, constant: 20).isActive = true
        experimentDescriptionImage1.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -25).isActive = true
        experimentDescriptionImage1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        
        
        //experimentDescriptionImage2
        experimentDescriptionImage2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        experimentDescriptionImage2.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6 ).isActive = true
        experimentDescriptionImage2.topAnchor.constraint(equalTo: experimentTextDescription.bottomAnchor, constant: 20).isActive = true
        experimentDescriptionImage2.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -25).isActive = true
        experimentDescriptionImage2.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 20).isActive = true
     }
}
