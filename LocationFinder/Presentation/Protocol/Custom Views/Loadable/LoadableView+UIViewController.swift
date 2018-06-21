//
//  LoadableView+UIViewController.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension LoadableView where Self: UIViewController {
    
    func showActivityIndicatorView(at viewElement: UIView? = nil) {
        let viewToShowActivityIndicatorOn: UIView = viewElement == nil ? view: viewElement!
        
        let activityIndicatorView = ActivityIndicatorView()
        viewToShowActivityIndicatorOn.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        setWidthConstraint(viewToShowActivityIndicatorOn.bounds.width, for: activityIndicatorView)
        setHeightConstraint(viewToShowActivityIndicatorOn.bounds.height, for: activityIndicatorView)
    }
    
    func hideActivityIndicatorView() {
        removeView(of: ActivityIndicatorView.self, from: view)
    }
}
