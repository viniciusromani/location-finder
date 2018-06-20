//
//  EmptyStateView.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
    
    private var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message string: String) {
        title = string
        super.init(frame: .zero)
        
        setup()
    }
}

extension EmptyStateView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        setTitleLabelConstraints()
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.setLeftConstraint(25, relatedTo: self)
        titleLabel.setCenterXConstraint(relatedTo: self)
        titleLabel.setCenterYConstraint(relatedTo: self)
    }
}
