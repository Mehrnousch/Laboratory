//
//  AddDetailTableViewCell.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 13.07.22.
//


import Foundation
import UIKit

class ExperimentDescriptionTableViewCell : UITableViewCell {
    
    public var eventHandler: ((Event) -> Void)?
    public enum Event {
        case removeItem(data: ExperimentDescription)
        
    }
    private lazy var container = UIView().autoLayoutView()
    private lazy var laborNameLabel = UILabel().autoLayoutView()
    private lazy var directionToDetail = UIButton().autoLayoutView()
    private lazy var experimentNameLabel = UILabel().autoLayoutView()
    private lazy var experimentDate = UILabel().autoLayoutView()
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
extension ExperimentDescriptionTableViewCell {
    
    /*func setupCell(data: ExperimentData) {
        originalLinkLabel.text = data.original_link
        shorterLink.text = data.full_short_link
        experimentData = data
    }pp*/
    
    func setupCell(data: ExperimentDescription) {
        laborNameLabel.text = "Title"
        experimentNameLabel.text = "Experiment Description"
        experimentDate.text = " 02.05.2022"
        experimentDescription = data
    }
}
//MARK: -directionToDetail
extension ExperimentDescriptionTableViewCell {

    @objc func directionToDetailPressed() {
        eventHandler?(.removeItem(data: ExperimentDescription()))
    }
}
// MARK: - SetupDefault

extension ExperimentDescriptionTableViewCell {
    
    
    func setupDefault() {}}


// MARK: - SetupUI

extension ExperimentDescriptionTableViewCell {
    
    
    func setupUI() {
        backgroundColor = UIColor.systemBackground
        contentView.addSubview(container)
        container.addSubview(laborNameLabel)
        container.addSubview(directionToDetail)
        container.addSubview(experimentNameLabel)
        container.addSubview(experimentDate)
 
        //container
        container.backgroundColor = UIColor.secondarySystemBackground
        container.layer.cornerRadius = 10
        
        //laborNameLabel
        laborNameLabel.translatesAutoresizingMaskIntoConstraints = false
        laborNameLabel.textColor = .label
        laborNameLabel.font = UIFont(name:"HelveticaNeue", size: 14)

        
        //experimentNameLabel
        experimentNameLabel.translatesAutoresizingMaskIntoConstraints = false
        experimentNameLabel.textColor = .label
        experimentNameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20)

        
        // experimentDate
        experimentDate.translatesAutoresizingMaskIntoConstraints = false
        experimentDate.textColor = .label
        experimentDate.font = UIFont(name:"HelveticaNeue", size: 14)
        experimentDate.backgroundColor = .tertiarySystemBackground
        
        //directionToDetail
        let image = UIImage(systemName: "chevron.right" )
        directionToDetail.setImage(image, for: .normal)
        
        
        
        
    }
    
    private func setupLayout() {
        
        //container
        container.heightAnchor.constraint(equalToConstant: 230).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        //laborNameLabel
        laborNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        laborNameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60).isActive = true
        laborNameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 25).isActive = true
        
    
        //experimentNameLabel
        experimentNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        experimentNameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        experimentNameLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
      
        
        //experimentDate
        experimentDate.widthAnchor.constraint(equalToConstant: 80).isActive = true
        experimentDate.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        experimentDate.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -25).isActive = true
 
        
        //directionToDetail
        directionToDetail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        directionToDetail.widthAnchor.constraint(equalToConstant: 50).isActive = true
        directionToDetail.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        directionToDetail.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
     }
}