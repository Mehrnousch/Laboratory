//
//  RegisterViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 01.08.22.
//



import Foundation
import Foundation
import SwiftFoundation
import UIKit

class RegisterViewController: UIViewController {
    
    enum Event {
        case dissmissed 
    }
    
    var eventHandler: ((Event) -> Void)?
    
    private lazy var container = UIView().autoLayoutView()
    private lazy var label = UILabel().autoLayoutView()
    private lazy var usernameLabel = UILabel().autoLayoutView()
    private lazy var usernameTextField = UITextField().autoLayoutView()
    private lazy var emailAddressLabel = UILabel().autoLayoutView()
    private lazy var emailAddressTextField = UITextField().autoLayoutView()
    private lazy var passwordLabel = UILabel().autoLayoutView()
    private lazy var passwordTextField = UITextField().autoLayoutView()
    private lazy var registerButton = UIButton().autoLayoutView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaults()
        setupUI()
        setupLayout()
    }
}

//MARK: - Life cycle
extension RegisterViewController {
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        eventHandler?(.dissmissed)
    }
    
}

//MARK: -Setup
extension RegisterViewController {
    
    func setupDefaults() {
        
        
    }


    
     
    private func setupUI() {
        
        view.backgroundColor = .secondarySystemBackground
        title = " Konto erstellen"
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true

//        label.translatesAutoresizingMaskIntoConstraints = false
//        container.addSubview(label)
//        label.textColor = .label
//        label.font = UIFont(name:"HelveticaNeue", size: 16)
//        label.textAlignment = .left
//        label.text = "Registrierung mein Konto"
//        label.backgroundColor = .secondarySystemBackground
//        label.layer.cornerRadius = 5
//        label.numberOfLines = 0
       
       
        //usernameLabel
        container.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Benutzername"
        usernameLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)

        //usernameTextField
        container.addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.borderStyle = .none
        usernameTextField.setBorder(width: 0.5, color: .systemGray)
        usernameTextField.setCornerRadius(10)
       // usernameTextField.placeholderText = "Benutzername"

        //E-mailAddressLabel
        container.addSubview(emailAddressLabel)
        emailAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        emailAddressLabel.text = "E-Mail-Adresse"
        emailAddressLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)

        //E-mailAddressTextField
        container.addSubview(emailAddressTextField)
        emailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        emailAddressTextField.borderStyle = .none
        emailAddressTextField.setBorder(width: 0.5, color: .systemGray)
        emailAddressTextField.setCornerRadius(10)
        
        //passwordLabel
        container.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Passwort"
        passwordLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)

        //passwordTextField
        container.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .none
        passwordTextField.setBorder(width: 0.5, color: .systemGray)
        passwordTextField.setCornerRadius(10)
        
        //registerButton
        container.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setCornerRadius(10)
        registerButton.backgroundColor = UIColor.purple
        registerButton.tintColor = .white
        registerButton.title = "Registrieren"
    }
    
    private func setupLayout() {
        
        //container
        container.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        //label
        //usernameLabel
        usernameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
       
        //UsernameTextfield
        usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        //emailLabel
        emailAddressLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20).isActive = true
        emailAddressLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        
        //emailTextFied
        emailAddressTextField.topAnchor.constraint(equalTo: emailAddressLabel.bottomAnchor, constant: 10).isActive = true
        emailAddressTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        emailAddressTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailAddressTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true

        //passwordLabel
        passwordLabel.topAnchor.constraint(equalTo: emailAddressTextField.bottomAnchor, constant: 20).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        
        //passwordTextField
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        //registerButton
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

}
    
}

