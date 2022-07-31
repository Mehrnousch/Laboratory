//
//  UICollectionReusableView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 26.07.22.
//

import Foundation
import UIKit

class SectionHeader:UICollectionReusableView{
    
    public lazy var label = UILabel().autoLayoutView()

     override init(frame: CGRect) {
         super.init(frame: frame)
         setupUI()
         setupLayout()
         setupDefault()
     }
         

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - data setup cell
extension SectionHeader {
    
    func setupCell(data: String){
        label.text = data
       
   }
    
}

// MARK: - SetupDefault

extension SectionHeader {
    
    private func setupDefault(){
    }

}



// MARK: - SetupUI

extension SectionHeader {
    
   private func setupUI(){
       addSubview(label)
       label.translatesAutoresizingMaskIntoConstraints = false

       label.textColor = .label
       label.font = UIFont(name:"HelveticaNeue-bold", size: 14)
       label.backgroundColor = .secondarySystemBackground
       label.setCornerRadius(3)
       label.textAlignment = .center
       
       
       
       
       
       
   }

    private func setupLayout(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
       // label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    }


