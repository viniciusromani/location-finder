//
//  UIViewController+NavigationBar.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideRightBarButtonItem() {
        navigationItem.rightBarButtonItem = nil
    }
    
    func showRightBarButtonItem(_ barButtonItem: UIBarButtonItem) {
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
}
