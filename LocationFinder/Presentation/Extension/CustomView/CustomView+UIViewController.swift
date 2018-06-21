//
//  CustomView+UIViewController.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension CustomView where Self: UIViewController {
    
    func removeView<Class: UIView>(of classType: Class.Type, from viewToSearch: UIView) {
        let subviews = viewToSearch.subviews
        guard subviews.count > 0 else { return }
        
        for subview in subviews {
            if subview is Class {
                subview.removeFromSuperview()
            }
            
            removeView(of: classType, from: subview)
        }
    }
}
