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
        guard let activityIndicatorView = findActivityIndicatorView(at: view) else { return }
        activityIndicatorView.removeFromSuperview()
    }
    
    private func findActivityIndicatorView(at viewToSearchOn: UIView) -> UIView? {
        for subview in viewToSearchOn.subviews {
            let activityIndicatorView = subview.subviews.first { $0 is ActivityIndicatorView } as? ActivityIndicatorView
            
            if let activityIndicator = activityIndicatorView {
                return activityIndicator
            } else {
                return findActivityIndicatorView(at: subview)
            }
        }
        return nil
    }
}
