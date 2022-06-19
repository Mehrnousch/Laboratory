//
//  InputViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import UIKit
import SwiftFoundation

public class InputsViewController: ViewController {
    
    enum Event {
        case succeededLogin(authentication: LoginAuthentication)
    }
    
    var eventHandler: ((Event) -> Void)?

    private lazy var mainStackView = StackView(axis: .vertical).autoLayoutView()
    private lazy var inputViews = LoginView().autoLayoutView()
    private lazy var bannerPresenter = BannerStatusPresenter()
}

// MARK: - Handlers

extension InputsViewController {
    
    override public func setupHandlers() {
        
        inputViews.eventHandler = { [weak self] events in
            guard let this = self else { return }
            switch events {
            case .askForLogin(let authentication):
                this.eventHandler?(.succeededLogin(authentication: authentication))
            }
        }
    }
}

// MARK: - API Calls

extension InputsViewController {
}

// MARK: - Defaults

extension InputsViewController {
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func configureNavigation() {
        title = "Login"
    }
    
    public override func setupStackViews() {
        mainStackView.addArrangedSubviews(inputViews, UIView())
    }
    
    public override func setupUI() {
        view.addSubviews(mainStackView)
        view.backgroundColor = UIColor.systemBackground
        
        configureNavigation()
    }
    
    public override func setupLayout() {
        LayoutConstraint.pin(to: .margins, mainStackView).activate()
    }
}


// MARK: - Testing method

extension InputsViewController {
    
    public func addReferenceLine(topAnchor: CGFloat) {
        inputViews.addReferenceLine(topAnchor: topAnchor)
    }
}
