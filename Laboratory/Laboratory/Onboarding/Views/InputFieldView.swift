//
//  InputFieldView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import UIKit
import SwiftFoundation

public class InputFieldView: View {
    
    enum Event {
        case didChanged(String)
    }
    
    var eventHandler: ((Event) -> Void)?
    
    public enum ModelTypes {
        case email
        case password
    }
    
    private var modelType: ModelTypes
    
    public init(modelType: ModelTypes) {
        self.modelType = modelType
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var doneButton = UIBarButtonItem(image: UIImage(systemName: "keyboard.chevron.compact.down"))
    private lazy var stackView = StackView(axis: .vertical).autoLayoutView()
    private lazy var labelStackView = StackView(axis: .horizontal).autoLayoutView()
    lazy var inputTextField = UITextFieldPadding().autoLayoutView()
    private lazy var errorLabel = UILabel().autoLayoutView()
}

// MARK: - TextField delegate

extension InputFieldView: UITextFieldDelegate {
    
    private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        changeLeftPasswordIcon(DidBeginEditing: text == "" ? false : true)
        eventHandler?(.didChanged(text))
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}


// MARK: - Handler and Methods

extension InputFieldView {
    
    public override func setupHandlers() {
        
        doneButton.setHandler(self) {
            $0.dismissKeyboard()
        }
        
        inputTextField.setEditingChangedHandler(self) {
            $0.activeAlarmMode(active: false)
            $0.textFieldDidChange($0.inputTextField)
        }
    }
}


// MARK: - UI Methods

extension InputFieldView {
    
    
    /// Add left and right padding to the the input TextField
    private func addPadding() {
        switch modelType {
        case .email:
            inputTextField.padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 20)
        case .password:
            inputTextField.padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        }
    }
    
    
    /// Add placeholder for the email and password TextField
    private func addPlaceholder() {
        inputTextField.placeholder = modelType == .email ? "Email address " : "Password"
    }
    
    
    /// Add left image view to the TextField
    /// - Parameter imageName: the system name of the target image
    private func setupLeftImage(imageName: String) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(systemName: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        inputTextField.leftView = imageContainerView
        inputTextField.leftViewMode = .always
    }
    
    
    /// Add border and corner radius to the TextField
    private func addRadiusBorder() {
        inputTextField.setCornerRadius(10)
        inputTextField.setBorder(width: 0.5, color: .systemGray)
    }
    
    
    /// Configure type  the email and password TextField
    private func configureTextfieldType() {
        switch modelType {
        case .email:
            inputTextField.textContentType = .emailAddress
        case .password:
            enablePasswordToggle()
            inputTextField.isSecureTextEntry = true
            inputTextField.textContentType = .password
        }
    }
    
    
    /// Add a button to the right side of password TextField to show and hide the password
    public func enablePasswordToggle() {
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        
        button.setTouchUpInsideHandler(self) {
            $0.setPasswordToggleImage(button)
            $0.inputTextField.isSecureTextEntry = !$0.inputTextField.isSecureTextEntry
        }
        
        inputTextField.rightView = button
        inputTextField.rightViewMode = .always
    }
    
    
    /// Set image for showing and hiding the password
    /// - Parameter button: the target button
    public func setPasswordToggleImage(_ button: UIButton) {
        if inputTextField.isSecureTextEntry {
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            
        }
    }
    
    /// Change the lock icon after start typing the password
    /// - Parameter DidBeginEditing: true when the the editing did begin
    private func changeLeftPasswordIcon(DidBeginEditing: Bool) {
        if modelType == .password {
            switch DidBeginEditing {
            case true:
                setupLeftImage(imageName: "lock.open")
            case false:
                setupLeftImage(imageName: "lock")
            }
        }
    }
    
    
    /// Active alarm mode when something goes wrong in the TextField
    /// - Parameter active: true if alarm mode should be activated
    public func activeAlarmMode(active: Bool) {
        switch active {
        case true:
            inputTextField.setBorder(width: 0.5, color: .systemRed)
        case false:
            inputTextField.setBorder(width: 0.5, color: .systemGray)
        }
    }
    
    
    /// Configure the error label
    private func configureLabel() {
        errorLabel.textColor = .systemRed
        errorLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    
    /// Show error message below the textfield
    /// - Parameter error: the error message
    public func showErrorMessage(error: String) {
        errorLabel.text = error
    }
}

// MARK: - Keyboard Methods

extension InputFieldView {
    
    public func dismissKeyboard() {
        endEditing(true)
    }
    
    private func setDoneOnKeyboard(button: UIBarButtonItem) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.items = [flexBarButton, button]
        inputTextField.inputAccessoryView = keyboardToolbar
    }
}


// MARK: - Defaults

extension InputFieldView {
    
    public override func setupDefaults() {
        inputTextField.delegate = self
    }
    
    public override func setupStackViews() {
        stackView.addArrangedSubviews(inputTextField, labelStackView)
        stackView.spacing = 5
        
        let emptyView = UIView()
        emptyView.widthAnchor.constraint(equalToConstant: 20).activate()
        labelStackView.addArrangedSubviews(emptyView, errorLabel)
    }
    
    public override func setupUI() {
        addSubviews(stackView)
        addPlaceholder()
        setupLeftImage(imageName: modelType == .email ? "person" :  "lock")
        addRadiusBorder()
        configureTextfieldType()
        addPadding()
        setDoneOnKeyboard(button: doneButton)
        configureLabel()
    }
    
    public override func setupLayout() {
        inputTextField.heightAnchor.constraint(equalToConstant: 44).activate()
        LayoutConstraint.pin(to: .bounds, stackView).activate()
        
        if DeviceType.isPad {
            inputTextField.widthAnchor.constraint(equalToConstant: 400).activate()
        }
    }
}



