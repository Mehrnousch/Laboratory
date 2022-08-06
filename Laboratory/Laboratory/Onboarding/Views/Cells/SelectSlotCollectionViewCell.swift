//
//  SelectSlotCollectionViewCell.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 25.07.22.
//
//


import Foundation
import UIKit

class SelectSlotCollectionViewCell: UICollectionViewListCell {
    private lazy var container = UIView().autoLayoutView()
    private lazy var label = UILabel().autoLayoutView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupDefault()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - data setup cell
extension SelectSlotCollectionViewCell {
    
    func setupCell(data: String){
        label.text = data
       
   }
    
}

// MARK: - SetupDefault

extension SelectSlotCollectionViewCell {
    
    private func setupDefault(){
    }

}



// MARK: - SetupUI

extension SelectSlotCollectionViewCell {
    
   private func setupUI(){
       //backgroundColor = UIColor.red
       contentView.addSubview(container)
       container.addSubview(label)
       //container
       container.backgroundColor = UIColor.lightBlue
       container.layer.cornerRadius = 6
       
       //label
       label.translatesAutoresizingMaskIntoConstraints = false

       label.textColor = .label
       label.font = UIFont(name:"HelveticaNeue", size: 14)
       label.textAlignment = .center
       
       
       
       
       
   }

    private func setupLayout(){
        
        //container
//        container.heightAnchor.constraint(equalToConstant:200).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        
        
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 5).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5).isActive = true
       
        
      
    }
    }


