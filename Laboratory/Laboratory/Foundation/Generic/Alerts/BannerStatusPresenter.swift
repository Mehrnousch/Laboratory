//
//  BannerStatusPresenter.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation
import SwiftFoundation
import UIKit

public class BannerStatusPresenter {
    
    public enum Status {
        case warning(text: String)
        case success(text: String)
        case info(text: String)
        case error(message: String?)
    }
    
    public enum Location {
        case top
        case bottom
    }

    
    enum Event {
        case didShow
        case didHide
    }
    
    var eventHandler: ((Event) -> Void)?
    
    private var view: BannerStatusView?
    private var timer: Timer?
    private let viewHeight: CGFloat = 44
    private let topinset: CGFloat = 30.0
    private let hideDelay: TimeInterval
    private lazy var location = Location.top
    
    private let mainWindows = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    
    public init(hideDelay: TimeInterval = 5) {
        self.hideDelay = hideDelay
    }
}

extension BannerStatusPresenter {
    
    public func show(status: Status, location: Location) {
        guard let window = mainWindows else { return }
        self.location = location
        
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let this = self else { return }
            this.view?.alpha = 0
        }, completion: { [weak self] _ in
            guard let this = self else { return }
            this.view?.removeFromSuperview()
            
            let xPosition = DeviceType.isPad ? window.bounds.midX - 250 : 16
            let yPosition = location == .top ? -window.bounds.height : window.bounds.height
            
            let phoneWidth:CGFloat = [window.bounds.width,  window.bounds.height].min()! // select the minimum size of phone screen for the width
            
            let frame = CGRect(x: xPosition, y: yPosition, width: DeviceType.isPad ? 500 : phoneWidth - 32, height: this.viewHeight)
            let view = BannerStatusView(status: status, frame: frame)
            view.eventHandler = { [weak self] in
                switch $0 {
                case .hide:
                    self?.hide()
                }
            }
            view.alpha = 0
            window.addSubview(view)
            this.view = view
            this.showAnimation(in: window)
        })
    }
}

extension BannerStatusPresenter {
    
    private func showAnimation(in window: UIWindow) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: hideDelay, repeats: false, block: { _ in
            self.hide()
        })
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: { [weak self] in
            guard let this = self else { return }

            this.view?.alpha = 1
            
            let yPosition = this.location == .top ? 70 : window.bounds.height - (DeviceType.isPad ? 100 : 70)
            this.view?.frame.origin.y = yPosition
        }, completion: { [weak self] isFinished in
            guard let this = self else { return }

            if isFinished {
                this.eventHandler?(.didShow)
            }
        })
    }
    
    func hide() {
        DispatchQueue.main.async { [weak self] in
            guard let this = self else { return }
            
            this.hide(isAnimated: true)
        }
    }
    
    func hide(isAnimated: Bool) {
        guard isAnimated else {
            view?.removeFromSuperview()
            view = nil
            eventHandler?(.didHide)
            return
        }
        view?.alpha = 1
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) { [weak self] in
            guard let this = self else { return }
            
            this.view?.alpha = 0
        }
        animator.addCompletion { [weak self] position in
            guard let this = self else { return }
            
            this.view?.removeFromSuperview()
            this.view = nil
            if position == .end {
                this.eventHandler?(.didHide)
            }
        }
        animator.startAnimation()
    }
}

extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
        // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
        // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}
