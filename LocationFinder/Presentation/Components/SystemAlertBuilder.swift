//
//  SystemAlertBuilder.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import UIKit

typealias AlertActionTuple = (title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?)

struct SystemAlertBuilder {
    
    private var alertController: UIAlertController
    
    init() {
        alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    }
    
    func setTitle(_ title: String) -> SystemAlertBuilder {
        alertController.title = title
        return self
    }
    
    func setMessage(_ message: String) -> SystemAlertBuilder {
        alertController.message = message
        return self
    }
    
    func setActions(with tuples: [AlertActionTuple]) -> SystemAlertBuilder {
        for tuple in tuples {
            let action = UIAlertAction(title: tuple.title, style: tuple.style, handler: tuple.handler)
            alertController.addAction(action)
        }
        return self
    }
    
    func build() -> UIAlertController {
        return alertController
    }
}
