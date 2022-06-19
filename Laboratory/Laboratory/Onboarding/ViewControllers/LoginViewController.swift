//
//  LoginViewController.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//


import UIKit
import SwiftFoundation

public class LoginViewController: ViewController {
    
    public enum Event {
        case presentDashboard
    }
    
    public var eventHandler: ((Event) -> Void)?
    
//    private lazy var accountPersistenceData: [AccountPersistenceModel] = []
//    private lazy var logo = UIImageView(image: MediaAssets.harmony_logo_white).autoLayoutView()
    
    public override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Life cycles

extension LoginViewController {
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presentInputsVC()
    }
}

// MARK: - Present VCs

extension LoginViewController {
    
    
    /// Present inputViewController that contains the login TextField
    public func presentInputsVC() {
        
        let vc = InputsViewController()
        let nc = UINavigationController(rootViewController: vc)
        nc.sheetPresentationController?.detents = [.medium()]
        nc.isModalInPresentation = true
        handleInputEvents(for: vc)
        self.present(nc, animated: true, completion: nil)
    }
    
    /// Present Dashboard view controller, it's called from ``InputsViewController/eventHandler``
       private func presentDashboardViewController() {
           lazy var  vc = DashboardViewController()
           lazy var nc = UINavigationController(rootViewController: vc)
           nc.modalPresentationStyle = .fullScreen
           present(nc, animated: true)

       }

}

// MARK: - VC handlers

extension LoginViewController {
    
    /// Handle events of InputsViewController
    /// - Parameter vc: the target VC
    private func handleInputEvents(for vc: InputsViewController) {
        vc.eventHandler = { [weak self] events in
            guard let this = self else { return }
            switch events {
            case .succeededLogin(let authentication):
                this.dismiss(animated: true)
                this.presentDashboardViewController()
            }
        }
    }
    
}

// MARK: - API Calls

extension LoginViewController {
    
}

// MARK: - Defaults

extension LoginViewController {
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    public override func setupUI() {
//        view.addSubviews(logo)
        view.backgroundColor = UIColor.purple
        
     
    }
    
    public override func setupLayout() {
        
    }
}
