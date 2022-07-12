//
//  TableBackgroundView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//


import Foundation
import UIKit

class TableBackgroundView: UIView {
    
    private lazy var emptyImage = UIImage(named: "no-URL")
    private lazy var noDataImage = UIImageView(image: emptyImage)
    
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension TableBackgroundView {
    
    func setupUI() {
        addSubview(noDataImage)
        noDataImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        noDataImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        noDataImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

        noDataImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noDataImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}


