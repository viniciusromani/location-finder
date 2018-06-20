//
//  UIView+NSLayoutConstraint.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension UIView {
    func setWidthConstraint(_ constraintValue: CGFloat) {
        let widthConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        self.addConstraint(widthConstraint)
    }
    
    func setHeightConstraint(_ constraintValue: CGFloat) {
        let heightConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        self.addConstraint(heightConstraint)
    }
    
    func setTopConstraint(_ constraintValue: CGFloat, relatedTo relatedView: UIView?) {
        let topConstraint = NSLayoutConstraint(item: self,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: relatedView,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: constraintValue)
        relatedView?.addConstraint(topConstraint)
    }
    
    func setBottomConstraint(_ constraintValue: CGFloat, relatedTo relatedView: UIView?) {
        let bottomConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: relatedView,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        relatedView?.addConstraint(bottomConstraint)
    }
    
    func setLeftConstraint(_ constraintValue: CGFloat, relatedTo relatedView: UIView?) {
        let leftConstraint = NSLayoutConstraint(item: self,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: relatedView,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: constraintValue)
        relatedView?.addConstraint(leftConstraint)
    }
    
    func setRightConstraint(_ constraintValue: CGFloat, relatedTo relatedView: UIView?) {
        let rightConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: relatedView,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        relatedView?.addConstraint(rightConstraint)
    }
    
    func setCenterXConstraint(relatedTo relatedView: UIView?) {
        let centerXConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: relatedView,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        relatedView?.addConstraint(centerXConstraint)
    }
    
    func setCenterYConstraint(relatedTo relatedView: UIView?) {
        let centerYConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: relatedView,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        relatedView?.addConstraint(centerYConstraint)
    }
    
    func setConstraints(with format: String, for views: [String: Any]) {
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format,
                                                         options: [],
                                                         metrics: nil,
                                                         views: views)
        self.addConstraints(constraints)
    }
}
