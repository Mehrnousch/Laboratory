//
//  LoginView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import UIKit
import SwiftFoundation

public class LoginView: View {
    
    enum Event {
        case askForLogin(authentication: LoginAuthentication)
    }
    
    var eventHandler: ((Event) -> Void)?
    
    private lazy var accentColor = UIColor.purple

    private lazy var mainStackView = StackView(axis: .vertical).autoLayoutView()
    private lazy var emailTextField = InputFieldView(modelType: .email).autoLayoutView()
    private lazy var passwordTextField = InputFieldView(modelType: .password).autoLayoutView()
    private lazy var loginButton = Button(title: "Login", radius: 12, height: 44, color: accentColor!, tintColor: .white).autoLayoutView()
    private lazy var forgetPasswordButton = UIButton().autoLayoutView()
    
    private lazy var bannerPresenter = BannerStatusPresenter()
    
    private lazy var email = ""
    private lazy var password = ""
}

// MARK: - Handler

extension LoginView {
    
    public override func setupHandlers() {
        
        emailTextField.eventHandler = { [weak self] events in
            guard let this = self else { return }
            switch events {
            case .didChanged(let email):
                
                if isValidEmail(email) {
                    this.email = email
                    this.emailTextField.activeAlarmMode(active: false)
                    this.emailTextField.showErrorMessage(error: "")
                } else {
                    this.emailTextField.activeAlarmMode(active: true)
                    this.emailTextField.showErrorMessage(error: "Enter valid email address")
                }
            }
        }
        
        passwordTextField.eventHandler = { [weak self] events in
            guard let this = self else { return }
            switch events {
            case .didChanged(let password):
                this.password = password
                this.passwordTextField.showErrorMessage(error: password == "" ? "Enter your password" : "")

            }
        }
        
        loginButton.setTouchUpInsideHandler(self) {
            $0.emailTextField.dismissKeyboard()
            $0.passwordTextField.dismissKeyboard()
            $0.validateDataForLogin()
        }
    }
    
}

// MARK: - Method

extension LoginView {
    
    
    /// Check email and password textfield to have validate data, then send them to the parent
    private func validateDataForLogin() {
        if checkBothInputsValues() {
            checkEmailValue()
            checkPasswordValue()
        }
        sendInputValuesForLogin()
    }
    
    
    /// Check the value of username and password and do the necessary action if they are empty
    /// - Returns: true if email and password values are passed
    private func checkBothInputsValues() -> Bool {
        if email == "", password == "" {
            emailTextField.activeAlarmMode(active: true)
            passwordTextField.activeAlarmMode(active: true)
            bannerPresenter.show(status: .warning(text:  "Please enter your email address and password"), location: .bottom)
            return false
        }
        return true
    }
    
    
    /// Check email value and do  the necessary action if it is empty
    private func checkEmailValue() {
        if email == "" {
            emailTextField.activeAlarmMode(active: true)
            emailTextField.showErrorMessage(error: "Enter valid email address")
        }
    }
    
    /// Check password value and do  the necessary action if it is empty
    private func checkPasswordValue() {
        if password == "" {
            passwordTextField.activeAlarmMode(active: true)
            passwordTextField.showErrorMessage(error: "Enter your password")
        }
    }
    
    
    /// Prepare and check values and send them for login
    private func sendInputValuesForLogin() {
        if email != "", password != "" {
            if isValidEmail(email) {
                passwordTextField.showErrorMessage(error: "")
                loginButton.loadingIndicator(true, title: "Login".uppercased(), color: .white)
                
                let authentication = LoginAuthentication(email: email, password: password)
                eventHandler?(.askForLogin(authentication: authentication))
            }
        }
    }
    
    
    /// deactivate loading Indicator on the login button when an error occurs
    public func deactivateLoadingIndicator() {
        loginButton.loadingIndicator(false, title: "Login".uppercased(), color: .white)
    }
    
}


// MARK: - UITraitCollection

extension LoginView {
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        addShadowToContainer(view: loginButton, userInterfaceStyle: traitCollection.userInterfaceStyle)
    }
}

// MARK: - Defaults

extension LoginView {
    
    public override func setupStackViews() {
        mainStackView.addArrangedSubviews(emailTextField, passwordTextField, loginButton,  forgetPasswordButton)
        mainStackView.spacing = 10
        mainStackView.setCustomSpacing(20, after: loginButton)
        
        let customSpace: CGFloat = (DeviceType.isPhoneSE1 || DeviceType.isPhone8 ? 20 : 40)
        mainStackView.setCustomSpacing(customSpace, after: passwordTextField)
    }
    
    public override func setupUI() {
        addSubviews(mainStackView)
        forgetPasswordButton.titleColor = UIColor.purple
        forgetPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgetPasswordButton.isHidden = true
        
        addShadowToContainer(view: loginButton, userInterfaceStyle: traitCollection.userInterfaceStyle)
    }
    
    public override func setupLayout() {
        LayoutConstraint.pin(to: .horizontallyToSafeArea, mainStackView).activate()
        
        let customSpace: CGFloat = (DeviceType.isPhoneSE1 || DeviceType.isPhone8 ? 10 : 30)
        mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: customSpace).activate()
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
    }
}


// MARK: - Testing method

extension LoginView {
    
    public func addReferenceLine(topAnchor value: CGFloat) {
        let line = UIView().autoLayoutView()
        line.backgroundColor = .systemRed
        addSubview(line)

        line.heightAnchor.constraint(equalToConstant: 2).activate()
        line.topAnchor.constraint(equalTo: topAnchor, constant: value).activate()
        line.leftAnchor.constraint(equalTo: leftAnchor).activate()
        line.rightAnchor.constraint(equalTo: rightAnchor).activate()
    }
}
