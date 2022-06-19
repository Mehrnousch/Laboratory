//
//  BannerStatusView.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import UIKit


class BannerStatusView: UIView {
    
    enum Event {
        case hide
    }
    
    var eventHandler: ((Event) -> Void)?
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setImage( UIImage(systemName: "xmark.circle"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    init(status: BannerStatusPresenter.Status, frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        layer.cornerRadius = 10
        
        backgroundColor = status.color
        
        addSubview(textLabel)
        textLabel.text = status.text
        textLabel.frame = CGRect(x: 15, y: 1, width: bounds.width - 40, height: 40)
        
        addSubview(button)
        button.frame = CGRect(x: bounds.width - 32, y: 10, width: 24, height: 24)
        button.setTouchUpInsideHandler(self) {
            $0.eventHandler?(.hide)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

private extension BannerStatusPresenter.Status {
    
    var text: String {
        switch self {
        case .warning(let text):
            return text
        case .success(let text):
            return text
        case .info(let text):
            return text
        case .error(let message):
            return message ?? ""
        }
    }
    
    var color: UIColor {
        switch self {
        case .warning, .error:
            return .systemRed
        case .info:
            return .systemGray
        case .success:
            return .systemGreen
        }
    }
}
