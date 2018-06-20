//
//  ControllableView.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 20/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

protocol ControllableView: CustomView {
    func showEmptyState(withMessage message: String, at viewElement: UIView?)
    func hideEmptyState()
}
