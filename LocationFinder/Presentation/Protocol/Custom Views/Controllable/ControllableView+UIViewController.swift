//
//  ControllableView+UIViewController.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

extension ControllableView where Self: UIViewController {
    func showEmptyState(withMessage message: String, at viewElement: UIView? = nil) {
        let viewToShowEmptyStateOn: UIView = viewElement == nil ? view: viewElement!
        
        let emptyStateView = EmptyStateView(message: message)
        viewToShowEmptyStateOn.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        
        setWidthConstraint(viewToShowEmptyStateOn.bounds.width, for: emptyStateView)
        setHeightConstraint(viewToShowEmptyStateOn.bounds.height, for: emptyStateView)
    }
    
    func hideEmptyState() {
        removeView(of: EmptyStateView.self, from: view)
    }
}
