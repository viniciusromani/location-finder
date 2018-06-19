//
//  NavigationBarTheme.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationBarTheme {
    var backgroundColor: UIColor? { get set }
    var titleColor: UIColor? { get set }
    var style: UIBarStyle { get set }
}
