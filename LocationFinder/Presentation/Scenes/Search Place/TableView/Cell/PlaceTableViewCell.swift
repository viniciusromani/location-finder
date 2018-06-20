//
//  PlaceTableViewCell.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    
    func configure(with viewModel: PlaceViewModel) {
        addressLabel.text = viewModel.address
    }
    
    func configure(with string: String) {
        addressLabel.text = string
    }
}
