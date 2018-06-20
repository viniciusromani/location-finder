//
//  ActivityIndicatorView.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
}

extension ActivityIndicatorView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.black
        activityIndicator.startAnimating()
        
        addSubview(activityIndicator)
        setActivityIndicatorConstraints()
    }
    
    private func setActivityIndicatorConstraints() {
        activityIndicator.setWidthConstraint(40)
        activityIndicator.setHeightConstraint(40)
        activityIndicator.setCenterXConstraint(relatedTo: self)
        activityIndicator.setCenterYConstraint(relatedTo: self)
    }
}
