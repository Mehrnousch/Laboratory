//
//  GlobalFunctions.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import UIKit

/// Add shadow to a view container
/// - Parameters:
///   - view: The target view
///   - userInterfaceStyle: Constants that indicate the interface style for the app.
public func addShadowToContainer(view: UIView, userInterfaceStyle: UIUserInterfaceStyle) {
    
    if userInterfaceStyle == .light {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
    } else {
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.masksToBounds = true
    }
}
