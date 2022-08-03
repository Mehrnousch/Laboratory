//
//  successfullyReservation.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 02.08.22.
//

import Foundation
import UIKit

class successfullyReservation: UIViewController {
   
    private lazy var label = UILabel().autoLayoutView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaults()
        setupUI()
        setupLayout()
    }
    private var laboratoryName : String
    private var selectedTime : String
    private var selectedDate : String
   
    init(laboratoryName: String, selectedTime: String, selectedDate: String) {
        self.laboratoryName = laboratoryName
        self.selectedTime = selectedTime
        self.selectedDate = selectedDate
           super.init(nibName: nil, bundle: nil)
       }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
}



//MARK: -Setup
extension successfullyReservation {
    
    func setupDefaults() {
        
        
    }


    
     
    private func setupUI() {
        
        view.backgroundColor = .secondarySystemBackground
        title =  laboratoryName
        view.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.text = "Sie haben das \(laboratoryName)  am \(selectedDate) um \(selectedTime) Uhr erfolgreich reserviert."
        label.numberOfLines = 0


       
    }
    
    private func setupLayout() {
        
        
        //label
        label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

}
    
}

