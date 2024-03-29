//
//  AddExperimentDescription.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 03.08.22.
//


import Foundation
import UIKit
import SwiftUI

class AddExperimentDescription: UIViewController {
    private lazy var descriptionView = UIView().autoLayoutView()
    private lazy var textView = UITextView().autoLayoutView()
    private lazy var addImageButton1 = UIButton().autoLayoutView()
    private lazy var addImageButton2 = UIButton().autoLayoutView()
    private lazy var submitButton = UIButton().autoLayoutView()
    private lazy var addImage1Label = UILabel().autoLayoutView()
    private lazy var addImage2Label = UILabel().autoLayoutView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupUI()
        setupLayout()
        
    }
    
//    private var laboratoryName : String
//    private var selectedDate : String
//    private var selectedTime : String
//    init(laboratoryName: String, selectedTime : String, selectedDate : String) {
//        self.laboratoryName = laboratoryName
//        self.selectedTime = selectedTime
//        self.selectedDate = selectedDate
//           super.init(nibName: nil, bundle: nil)
//       }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//
//    }
}
// MARK: - TextView

extension AddExperimentDescription {

    private func textLimit(existingText: String?,
                           newText: String,
                           limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
    
}
// MARK: - UICollectionViewDelegate
extension AddExperimentDescription: UITextViewDelegate {
   func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String
    ) -> Bool {
        return self.textLimit(existingText: textView.text, newText: text,limit: 200)
    }
  
}
// MARK: - Keyboard methods

extension AddExperimentDescription {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

   @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

// MARK: - Setup UI
extension AddExperimentDescription {
    
    func setupDefault() {
        textView.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // dismissKeyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Experimentbeschreibung"
        view.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.setCornerRadius(12)
        view.backgroundColor = .systemBackground
        descriptionView.backgroundColor = .secondarySystemBackground

//      addImageButton1
        descriptionView.addSubview(addImageButton1)
        addImageButton1.translatesAutoresizingMaskIntoConstraints = false
        addImageButton1.setCornerRadius(12)
        addImageButton1.tintColor = .white
//        addImageButton1.backgroundColor = .purple
//        addImageButton1.image = UIImage(systemName: "paperclip")
        addImageButton1.image = UIImage(systemName: "paperclip")!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        addImageButton1.tintColor = .gray
        addImageButton1.image?.withTintColor(.gray)
        addImageButton1.imageView?.layer.transform = CATransform3DMakeScale(2, 2, 2)

//      addImage1Label
        descriptionView.addSubview(addImage1Label)
        addImage1Label.translatesAutoresizingMaskIntoConstraints = false
        addImage1Label.text = "Füge ein Foto hinzu"
        addImage1Label.textColor = .gray
        
////      addImageButton2
//        descriptionView.addSubview(addImageButton2)
//        addImageButton2.translatesAutoresizingMaskIntoConstraints = false
//        addImageButton2.setCornerRadius(12)
//        addImageButton2.tintColor = .white
//        addImageButton2.backgroundColor = .purple
//        addImageButton2.image = UIImage(systemName: "photo")
//        addImageButton2.imageView?.layer.transform = CATransform3DMakeScale(3, 3, 3)
        
////      addImage2Label
//        descriptionView.addSubview(addImage2Label)
//        addImage2Label.translatesAutoresizingMaskIntoConstraints = false
//        addImage2Label.text = "Füge ein Foto hinzu"

//      descriptionTextField
        descriptionView.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.setBorder(width: 0.5, color: .systemGray2)
        textView.backgroundColor = .systemBackground
        textView.setCornerRadius(12)
        textView.textAlignment = .center
        textView.textColor = .label
        textView.autocapitalizationType = .none
        textView.font = UIFont(name:"HelveticaNeue", size: 16)

        
//      submitButton
        descriptionView.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.title = "submit"
        submitButton.setCornerRadius(12)
        submitButton.tintColor = .white
        submitButton.backgroundColor = .blueGreen
        
        
        
    }
    
    func setupLayout() {
//      descriptionView
        descriptionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        

        
//      addImageButton1
        addImageButton1.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 20).isActive = true
        addImageButton1.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20).isActive = true
        addImageButton1.heightAnchor.constraint(equalToConstant: 44).isActive = true
        addImageButton1.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
//      addImage1LAbel
        addImage1Label.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 20).isActive = true
        addImage1Label.leadingAnchor.constraint(equalTo: addImageButton1.trailingAnchor, constant: 5).isActive = true
        addImage1Label.heightAnchor.constraint(equalToConstant: 44).isActive = true

        
////        addImageButton2
//        addImageButton2.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 20).isActive = true
//        addImageButton2.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -50).isActive = true
//        addImageButton2.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        addImageButton2.widthAnchor.constraint(equalToConstant: 80).isActive = true
//
//        //addImage2LAbel
//                addImage2Label.topAnchor.constraint(equalTo: addImageButton1.bottomAnchor, constant: 10).isActive = true
//                addImage2Label.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20).isActive = true
//                addImage2Label.heightAnchor.constraint(equalToConstant: 44).isActive = true
//
//        descriptionTextField
        textView.topAnchor.constraint(equalTo: addImage1Label.bottomAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -20).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
//        submitButton
        submitButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 120).isActive = true

    }
}



