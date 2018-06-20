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
        guard let emptyStateView = findEmptyStateView(at: view) else { return }
        emptyStateView.removeFromSuperview()
    }
    
    private func findEmptyStateView(at viewToFind: UIView) -> UIView? {
        for subview in viewToFind.subviews {
            let emptyStateView = subview.subviews.first { $0 is EmptyStateView } as? EmptyStateView
            
            if let emptyState = emptyStateView {
                return emptyState
            } else {
                return findEmptyStateView(at: subview)
            }
        }
        return nil
    }
}
