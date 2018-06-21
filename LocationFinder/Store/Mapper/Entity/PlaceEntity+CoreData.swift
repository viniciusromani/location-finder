//
//  PlaceEntity+CoreData.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import CoreData

extension PlaceEntity {
    init(mapping managedObject: NSManagedObject) {
        address = managedObject.value(forKey: "address") as? String ?? ""
        latitude = managedObject.value(forKey: "latitude") as? Float ?? 0
        longitude = managedObject.value(forKey: "longitude") as? Float ?? 0
    }
}
