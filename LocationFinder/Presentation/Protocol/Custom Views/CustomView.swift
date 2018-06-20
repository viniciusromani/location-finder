//
//  CustomView.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

protocol CustomView {
    func setWidthConstraint(_ constraintValue: CGFloat, for view: UIView)
    func setHeightConstraint(_ constraintValue: CGFloat, for view: UIView)
    func setTopConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?)
    func setBottomConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?)
    func setLeftConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?)
    func setRightConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?)
    func setCenterXConstraint(for view: UIView, relatedTo relatedView: UIView?)
    func setCenterYConstraint(for view: UIView, relatedTo relatedView: UIView?)
}

extension CustomView {
    func setWidthConstraint(_ constraintValue: CGFloat, for view: UIView) {
        let widthConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        view.addConstraint(widthConstraint)
    }
    
    func setHeightConstraint(_ constraintValue: CGFloat, for view: UIView) {
        let heightConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        view.addConstraint(heightConstraint)
    }
    
    func setTopConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let topConstraint = NSLayoutConstraint(item: view,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: relatedView,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: constraintValue)
        view.addConstraint(topConstraint)
    }
    
    func setBottomConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let bottomConstraint = NSLayoutConstraint(item: view,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: relatedView,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: constraintValue)
        view.addConstraint(bottomConstraint)
    }
    
    func setLeftConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let leftConstraint = NSLayoutConstraint(item: view,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: relatedView,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: constraintValue)
        view.addConstraint(leftConstraint)
    }
    
    func setRightConstraint(_ constraintValue: CGFloat, for view: UIView, relatedTo relatedView: UIView?) {
        let rightConstraint = NSLayoutConstraint(item: view,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: relatedView,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: constraintValue)
        view.addConstraint(rightConstraint)
    }
    
    func setCenterXConstraint(for view: UIView, relatedTo relatedView: UIView?) {
        let centerXConstraint = NSLayoutConstraint(item: view,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: relatedView,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        relatedView?.addConstraint(centerXConstraint)
    }
    
    func setCenterYConstraint(for view: UIView, relatedTo relatedView: UIView?) {
        let centerYConstraint = NSLayoutConstraint(item: view,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: relatedView,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        relatedView?.addConstraint(centerYConstraint)
    }
}
