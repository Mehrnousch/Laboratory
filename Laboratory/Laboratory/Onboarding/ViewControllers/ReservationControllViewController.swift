

//
//  CompleteReservation.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 07.08.22.
//

import Foundation
import UIKit
import SwiftUI

class ReservationControllViewController: UIViewController {
    private lazy var container = UIView().autoLayoutView()
    private lazy var label = UILabel().autoLayoutView()
    private lazy var protocolbutton = UIButton().autoLayoutView()
    private lazy var protocolbuttonLabel = UILabel().autoLayoutView()
    private lazy var security‌Button = UIButton().autoLayoutView()
    private lazy var security‌ButtonLabel = UILabel().autoLayoutView()
    
    private lazy var experimentTitleLabel = UILabel().autoLayoutView()
    private lazy var experimentTitleTextView = UITextView().autoLayoutView()
    
    private lazy var userAgreementView = UIView().autoLayoutView()
    private lazy var userAgreementCheckbox = UIButton(type: .custom).autoLayoutView()
    private lazy var userAgreementLabel = UILabel().autoLayoutView()
    
    private lazy var responsiblePersonView = UIView().autoLayoutView()
    private lazy var responsiblePersoncheckbox = UIButton().autoLayoutView()
    private lazy var responsiblePersonLabel = UILabel().autoLayoutView()
  
    private lazy var submitButton = UIButton().autoLayoutView()
   
    private lazy var unchecked = true

    public var eventHandler: ((Event) -> Void)?
    public enum Event{
       case askLaborName(laboratoryName: String)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
    
    private var laboratoryName : String
    private var selectedDate : String
    private var selectedTime : String
    init(laboratoryName: String, selectedTime : String, selectedDate : String) {
        self.laboratoryName = laboratoryName
        self.selectedTime = selectedTime
        self.selectedDate = selectedDate
           super.init(nibName: nil, bundle: nil)
       }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}
//MARK: -Button
extension ReservationControllViewController {
    
    @objc func pressed(sender: UIBarButtonItem) {
        let laboratoryName = laboratoryName
        eventHandler?(.askLaborName(laboratoryName : laboratoryName))
        let vc = successfullyReservation(laboratoryName: laboratoryName,selectedTime : selectedTime, selectedDate : selectedDate )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: -checkboxUserAgreement
extension ReservationControllViewController {
    
@objc func toggleCheckboxSelectionUserAgreement() {
    userAgreementCheckbox.isSelected = !userAgreementCheckbox.isSelected
}
    
}
//MARK: -checkboxResponsiblePerson
extension ReservationControllViewController {
    
@objc func toggleCheckboxSelectionResponsiblePerson() {
    responsiblePersoncheckbox.isSelected = !responsiblePersoncheckbox.isSelected
}
    
}
// MARK: - tick
extension ReservationControllViewController {
    
@IBAction func tick(sender: UIButton) {
    if unchecked {
        sender.setImage(UIImage(named:"checkmark.square.fill"), for: .normal)
        unchecked = false
    }
    else {
        sender.setImage( UIImage(named:"checkmark.square"), for: .normal)
        unchecked = true
    }
}
}

// MARK: - Setup UI
extension ReservationControllViewController {
    
    func setupDefault() {
       
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        title = "\(laboratoryName) am \(selectedDate) um \(selectedTime)"
        
        
//        container
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemBackground
        
        
//        label
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = false
        label.textColor = .label
        label.font = UIFont(name:"HelveticaNeue", size: 14)
        label.textAlignment = .left
        label.text = "Bitte laden Sie die Sicherheitsinformationen und Laborprotokolle herunter und lesen Sie sie durch."
        label.backgroundColor = .systemBackground
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
       
       
        //securityButton&Label
        container.addSubview(security‌Button)
        security‌Button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "pdf.png" )
        security‌Button.setImage(image, for: .normal)
        container.addSubview(security‌ButtonLabel)
        security‌ButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        security‌ButtonLabel.text = "Sicherheit"
        security‌ButtonLabel.font = UIFont(name:"HelveticaNeue", size: 12)

        //protocolButton&Label
        container.addSubview(protocolbutton)
        protocolbutton.translatesAutoresizingMaskIntoConstraints = false
        protocolbutton.setImage(image, for: .normal)
        container.addSubview(protocolbuttonLabel)
        protocolbuttonLabel.translatesAutoresizingMaskIntoConstraints = false
        protocolbuttonLabel.text = "Protocol"
        protocolbuttonLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        
        
        //experimentTitle
        container.addSubview(experimentTitleTextView)
        experimentTitleTextView.translatesAutoresizingMaskIntoConstraints = false
        experimentTitleTextView.setCornerRadius(10)
        experimentTitleTextView.setBorder(width: 0.5, color: .gray)
        experimentTitleTextView.backgroundColor = .systemBackground
        experimentTitleTextView.textColor = .label
        experimentTitleTextView.font = UIFont(name:"HelveticaNeue", size: 14)
        
        //experimentTitleLabel
        container.addSubview(experimentTitleLabel)
        experimentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        experimentTitleLabel.textColor = .label
        experimentTitleLabel.font = UIFont(name:"HelveticaNeue", size: 14)
        experimentTitleLabel.text = "Bitte geben Sie Ihren Experimenttitel ein:"

        //userAgreementView
        container.addSubview(userAgreementView)
        userAgreementView.translatesAutoresizingMaskIntoConstraints = false
        
        // checkboxUserAgreement
        userAgreementView.addSubview(userAgreementCheckbox)
        userAgreementCheckbox.translatesAutoresizingMaskIntoConstraints = false
        userAgreementCheckbox.setImage(UIImage.init(named: "squarr"), for: .normal)
        userAgreementCheckbox.setImage(UIImage.init(named: "checkmark.square"), for: .selected)
        userAgreementCheckbox.addTarget(self, action: #selector(self.toggleCheckboxSelectionUserAgreement), for: .touchUpInside)
        
        //userAgreementLabel
        userAgreementView.addSubview(userAgreementLabel)
        userAgreementLabel.translatesAutoresizingMaskIntoConstraints = false
        userAgreementLabel.numberOfLines = 0
        userAgreementLabel.text = "Ich habe die Protokolle und Sicherheitsinformationen gelesen und stimme ihnen zu."
        userAgreementLabel.font = UIFont(name:"HelveticaNeue", size: 12)

        

        //responsiblePersonView
        container.addSubview(responsiblePersonView)
        responsiblePersonView.translatesAutoresizingMaskIntoConstraints = false
        
        // checkboxResponsiblePerson
        responsiblePersonView.addSubview(responsiblePersoncheckbox)
        responsiblePersoncheckbox.translatesAutoresizingMaskIntoConstraints = false
        responsiblePersoncheckbox.setImage(UIImage.init(named: "squarr"), for: .normal)
        responsiblePersoncheckbox.setImage(UIImage.init(named: "checkmark.square"), for: .selected)
        responsiblePersoncheckbox.addTarget(self, action: #selector(self.toggleCheckboxSelectionResponsiblePerson), for: .touchUpInside)
        
        //responsiblePersonLabel
        responsiblePersonView.addSubview(responsiblePersonLabel)
        responsiblePersonLabel.translatesAutoresizingMaskIntoConstraints = false
        responsiblePersonLabel.numberOfLines = 0
        responsiblePersonLabel.text = "Ich brauche die Anwesenheit der verantwortlichen Person im Labor."
        responsiblePersonLabel.font = UIFont(name:"HelveticaNeue", size: 12)

        
        //submitButton
        container.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.title = "einreichen"
        submitButton.setCornerRadius(10)
        submitButton.backgroundColor = .purple
        submitButton.tintColor = .white
        submitButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        
    }
    
    func setupLayout() {
        
//        container
        container.heightAnchor.constraint(equalToConstant: 450).isActive = true
//        container.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        //label
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        
     
        
        //security‌Button
        security‌Button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        security‌Button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        security‌Button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        security‌Button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 60).isActive = true
        
        //security‌ButtonLabel
        security‌ButtonLabel.topAnchor.constraint(equalTo: security‌Button.bottomAnchor, constant: 10).isActive = true
        security‌ButtonLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 60).isActive = true
        
        
       
        //protocolbutton
        protocolbutton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        protocolbutton.widthAnchor.constraint(equalToConstant: 60).isActive = true

        protocolbutton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        protocolbutton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60).isActive = true
        
        //protocolbuttonLabel
        protocolbuttonLabel.topAnchor.constraint(equalTo: protocolbutton.bottomAnchor, constant: 10).isActive = true
        protocolbuttonLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60).isActive = true
        
        //experimentTitleLabel
        experimentTitleLabel.topAnchor.constraint(equalTo: security‌ButtonLabel.bottomAnchor, constant: 20).isActive = true
        experimentTitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
       

        //experimentTitleTextView
        experimentTitleTextView.topAnchor.constraint(equalTo: experimentTitleLabel.bottomAnchor, constant: 10).isActive = true
        experimentTitleTextView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        experimentTitleTextView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        experimentTitleTextView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        
        //userAgreementView
        userAgreementView.topAnchor.constraint(equalTo: experimentTitleTextView.bottomAnchor, constant: 10).isActive = true
        userAgreementView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        userAgreementView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        userAgreementView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        //userAgreementCheckbox
        userAgreementCheckbox.topAnchor.constraint(equalTo: userAgreementView.topAnchor, constant: 5).isActive = true
        userAgreementCheckbox.leadingAnchor.constraint(equalTo: userAgreementView.leadingAnchor, constant: 10).isActive = true
        userAgreementCheckbox.heightAnchor.constraint(equalToConstant: 44).isActive = true
        userAgreementCheckbox.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        //userAgreementLabel
        userAgreementLabel.topAnchor.constraint(equalTo: userAgreementView.topAnchor, constant: 5).isActive = true
        userAgreementLabel.leadingAnchor.constraint(equalTo: userAgreementCheckbox.trailingAnchor, constant: 10).isActive = true
        userAgreementLabel.trailingAnchor.constraint(equalTo: userAgreementView.trailingAnchor, constant: 0).isActive = true
        
        
        
        
        
        //ResponsiblePersonView
        responsiblePersonView.topAnchor.constraint(equalTo: userAgreementView.bottomAnchor, constant: 0).isActive = true
        responsiblePersonView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        responsiblePersonView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        responsiblePersonView.heightAnchor.constraint(equalToConstant: 54).isActive = true


        //checkboxResponsiblePerson
        responsiblePersoncheckbox.topAnchor.constraint(equalTo: responsiblePersonView.topAnchor, constant: 5).isActive = true
        responsiblePersoncheckbox.leadingAnchor.constraint(equalTo: responsiblePersonView.leadingAnchor, constant: 10).isActive = true
        responsiblePersoncheckbox.heightAnchor.constraint(equalToConstant: 44).isActive = true
        responsiblePersoncheckbox.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        //ResponsiblePersonLabel
        responsiblePersonLabel.topAnchor.constraint(equalTo: responsiblePersonView.topAnchor, constant: 5).isActive = true
        responsiblePersonLabel.leadingAnchor.constraint(equalTo: responsiblePersoncheckbox.trailingAnchor, constant: 10).isActive = true
        responsiblePersonLabel.trailingAnchor.constraint(equalTo: responsiblePersonView.trailingAnchor, constant: 0).isActive = true
        
       
        
        //submitButton
        submitButton.topAnchor.constraint(equalTo: responsiblePersonView.bottomAnchor, constant: 10).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

    }
}


