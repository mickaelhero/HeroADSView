//
//  HA+UIView.swift
//  HeroADSView
//
//  Created by Mickael Belhassen on 08/08/2019.
//  Copyright © 2019 Mickael Belhassen. All rights reserved.
//

import UIKit

extension UIView {
    
    typealias Action = (() -> ())?
    
    private struct AssociatedObjectKeys {
        static var tapGesture: UInt8 = 10
    }
    
}


// MARK: Tapped gesture

extension UIView {
    
    var tapGestureHandler: Action {
        get {
            return associatedObject(base: self, key: &AssociatedObjectKeys.tapGesture) { return nil }
        }
        set {
            associateObject(base: self, key: &AssociatedObjectKeys.tapGesture, value: newValue)
        }
    }
    
    func addTappedGesture(action: (() -> Void)?) {
        tapGestureHandler = action
        isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        tapGestureHandler?()
    }
    
}

