//
//  ReservationControll.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 31.07.22.
//

import Foundation
import Foundation
import SwiftFoundation
import UIKit
import SwiftUI

class ReservationControllViewController: UIViewController {
    private lazy var securityContainer = UIView().autoLayoutView()
    private lazy var protocolContainer = UIView().autoLayoutView()
    private lazy var label = UILabel().autoLayoutView()
    private lazy var protocolbutton = UIButton().autoLayoutView()
    private lazy var security‌Button = UIButton().autoLayoutView()
    private lazy var protocolbuttonLabel = UILabel().autoLayoutView()
    private lazy var security‌ButtonLabel = UILabel().autoLayoutView()
    private lazy var unchecked = true
    private lazy var userAgreementView = UIView().autoLayoutView()
    private lazy var responsiblePersonView = UIView().autoLayoutView()
    private lazy var responsiblePersonLabel = UILabel().autoLayoutView()
    private lazy var checkboxResponsiblePerson = UIButton().autoLayoutView()
    private lazy var userAgreementLabel = UILabel().autoLayoutView()
    private lazy var checkboxUserAgreement = UIButton.init(type: .custom)
    private lazy var submitButton = UIButton().autoLayoutView()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
}
//MARK: -Button
extension ReservationControllViewController {
    
    @objc func pressed(sender: UIBarButtonItem) {
        let vc = successfullyReservation()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: -checkboxUserAgreement
extension ReservationControllViewController {
    
@objc func toggleCheckboxSelectionUserAgreement() {
    checkboxUserAgreement.isSelected = !checkboxUserAgreement.isSelected
}
    
}
//MARK: -checkboxResponsiblePerson
extension ReservationControllViewController {
    
@objc func toggleCheckboxSelectionResponsiblePerson() {
    checkboxResponsiblePerson.isSelected = !checkboxResponsiblePerson.isSelected
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
        view.backgroundColor = .secondarySystemBackground
        title = " Laboratory information"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true
        label.textColor = .label
        label.font = UIFont(name:"HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Please download and read the security information and laboratory protocols."
        label.backgroundColor = .secondarySystemBackground
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
       
       
        //securityContainer
        view.addSubview(securityContainer)
        securityContainer.translatesAutoresizingMaskIntoConstraints = false
        securityContainer.addSubview(security‌Button)
        security‌Button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "pdf.png" )
        security‌Button.setImage(image, for: .normal)
        securityContainer.addSubview(security‌ButtonLabel)
        security‌ButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        security‌ButtonLabel.text = "Sicherheit"
        
        //protocolContainer
        view.addSubview(protocolContainer)
        protocolContainer.translatesAutoresizingMaskIntoConstraints = false
        protocolContainer.addSubview(protocolbutton)
        protocolbutton.translatesAutoresizingMaskIntoConstraints = false
        protocolbutton.setImage(image, for: .normal)
        protocolContainer.addSubview(protocolbuttonLabel)
        protocolbuttonLabel.translatesAutoresizingMaskIntoConstraints = false
        protocolbuttonLabel.text = "Protokoll"
        
        //userAgreementView
        view.addSubview(userAgreementView)
        userAgreementView.translatesAutoresizingMaskIntoConstraints = false
        
        //userAgreementLabel
        userAgreementView.addSubview(userAgreementLabel)
        userAgreementLabel.translatesAutoresizingMaskIntoConstraints = false
        userAgreementLabel.numberOfLines = 0
        userAgreementLabel.text = "Ich habe die Protokolle und Sicherheitsinformationen gelesen und stimme ihnen zu."
        
        // checkboxUserAgreement
        responsiblePersonView.addSubview(checkboxUserAgreement)
        checkboxUserAgreement.translatesAutoresizingMaskIntoConstraints = false
        checkboxUserAgreement.setImage(UIImage.init(named: "squarr"), for: .normal)
        checkboxUserAgreement.setImage(UIImage.init(named: "checkmark.square"), for: .selected)
        checkboxUserAgreement.addTarget(self, action: #selector(self.toggleCheckboxSelectionUserAgreement), for: .touchUpInside)

        //responsiblePersonView
        view.addSubview(responsiblePersonView)
        responsiblePersonView.translatesAutoresizingMaskIntoConstraints = false
        
        //responsiblePersonLabel
        responsiblePersonView.addSubview(responsiblePersonLabel)
        responsiblePersonLabel.translatesAutoresizingMaskIntoConstraints = false
        responsiblePersonLabel.numberOfLines = 0
        responsiblePersonLabel.text = "Ich brauche die Anwesenheit der verantwortlichen Person im Labor."
        
        // checkboxResponsiblePerson
        responsiblePersonView.addSubview(checkboxResponsiblePerson)
        checkboxResponsiblePerson.translatesAutoresizingMaskIntoConstraints = false
        checkboxResponsiblePerson.setImage(UIImage.init(named: "squarr"), for: .normal)
        checkboxResponsiblePerson.setImage(UIImage.init(named: "checkmark.square"), for: .selected)
        checkboxResponsiblePerson.addTarget(self, action: #selector(self.toggleCheckboxSelectionResponsiblePerson), for: .touchUpInside)
        
        

        //submitButton
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.title = "einreichen"
        submitButton.setCornerRadius(10)
        submitButton.backgroundColor = .systemGray2
        submitButton.tintColor = .white
        submitButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        
    }
    
    func setupLayout() {
        //label
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        //securityContainer
        securityContainer.heightAnchor.constraint(equalToConstant: 144).isActive = true
        securityContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true

        securityContainer.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        securityContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        
        //security‌Button
        security‌Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        security‌Button.widthAnchor.constraint(equalToConstant: 80).isActive = true

        security‌Button.topAnchor.constraint(equalTo: securityContainer.topAnchor, constant: 10).isActive = true
        security‌Button.leadingAnchor.constraint(equalTo: securityContainer.leadingAnchor, constant: 10).isActive = true
        
        //security‌ButtonLabel
        security‌ButtonLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        security‌ButtonLabel.topAnchor.constraint(equalTo: security‌Button.bottomAnchor, constant: 10).isActive = true
        security‌ButtonLabel.centerXAnchor.constraint(equalTo: securityContainer.centerXAnchor).isActive = true
        
        
        
        
        //protocolContainer
        protocolContainer.heightAnchor.constraint(equalToConstant: 144).isActive = true
        protocolContainer.widthAnchor.constraint(equalToConstant: 100).isActive = true
        protocolContainer.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        protocolContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        
        
        //protocolbutton
        protocolbutton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        protocolbutton.widthAnchor.constraint(equalToConstant: 80).isActive = true

        protocolbutton.topAnchor.constraint(equalTo: protocolContainer.topAnchor, constant: 10).isActive = true
        protocolbutton.trailingAnchor.constraint(equalTo: protocolContainer.trailingAnchor, constant: -10).isActive = true
        
        //protocolbuttonLabel
        protocolbuttonLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        protocolbuttonLabel.topAnchor.constraint(equalTo: protocolbutton.bottomAnchor, constant: 10).isActive = true
        protocolbuttonLabel.centerXAnchor.constraint(equalTo: protocolContainer.centerXAnchor).isActive = true
        
        //userAgreementView
        userAgreementView.topAnchor.constraint(equalTo: protocolContainer.bottomAnchor, constant: 20).isActive = true
        userAgreementView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        userAgreementView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        //userAgreementLabel
        userAgreementLabel.topAnchor.constraint(equalTo: userAgreementView.topAnchor, constant: 10).isActive = true
        userAgreementLabel.leadingAnchor.constraint(equalTo: userAgreementView.leadingAnchor, constant: 64).isActive = true
        userAgreementLabel.trailingAnchor.constraint(equalTo: userAgreementView.trailingAnchor, constant: -10).isActive = true
        //checkboxUserAgreement
//        checkboxUserAgreement.centerYAnchor.constraint(equalTo: userAgreementView.centerYAnchor).isActive = true
        checkboxUserAgreement.topAnchor.constraint(equalTo: userAgreementView.topAnchor, constant: 10).isActive = true
        checkboxUserAgreement.heightAnchor.constraint(equalToConstant: 44).isActive = true
        checkboxUserAgreement.widthAnchor.constraint(equalToConstant: 44).isActive = true
        checkboxUserAgreement.leadingAnchor.constraint(equalTo: userAgreementView.leadingAnchor, constant: 10).isActive = true
        
        
        //ResponsiblePersonView
        responsiblePersonView.topAnchor.constraint(equalTo: userAgreementLabel.bottomAnchor, constant: 20).isActive = true
        responsiblePersonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        responsiblePersonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        //ResponsiblePersonLabel
        responsiblePersonLabel.topAnchor.constraint(equalTo: responsiblePersonView.topAnchor, constant: 10).isActive = true
        responsiblePersonLabel.leadingAnchor.constraint(equalTo: responsiblePersonView.leadingAnchor, constant: 64).isActive = true
        responsiblePersonLabel.trailingAnchor.constraint(equalTo: responsiblePersonView.trailingAnchor, constant: -10).isActive = true
        
        //checkboxResponsiblePerson
//        checkboxUserAgreement.centerYAnchor.constraint(equalTo: userAgreementView.centerYAnchor).isActive = true
        checkboxResponsiblePerson.topAnchor.constraint(equalTo: responsiblePersonView.topAnchor, constant: 10).isActive = true
        checkboxResponsiblePerson.heightAnchor.constraint(equalToConstant: 44).isActive = true
        checkboxResponsiblePerson.widthAnchor.constraint(equalToConstant: 44).isActive = true
        checkboxResponsiblePerson.leadingAnchor.constraint(equalTo: responsiblePersonView.leadingAnchor, constant: 10).isActive = true
        
        //submitButton
        submitButton.topAnchor.constraint(equalTo: responsiblePersonLabel.bottomAnchor, constant: 50).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

    }
}


