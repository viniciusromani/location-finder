//
//  CoreDataLocalRepository.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataLocalRepository: CoreDataRepository {
    
    var context = AppDelegate().persistentContainer.viewContext
    
    func save(placeEntity place: PlaceEntity) {
        context.mergePolicy =  NSMergeByPropertyObjectTrumpMergePolicy
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        newPlace.setValue(place.address, forKey: "address")
        newPlace.setValue(place.latitude, forKey: "latitude")
        newPlace.setValue(place.longitude, forKey: "longitude")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func fetchPlace(with latitude: Float, and longitude: Float) -> PlaceEntity? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        request.predicate = NSPredicate(format: "latitude == %f && longitude == %f", latitude, longitude)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            guard result.count > 0 else { return nil }
            guard let managedObject = result.first as? NSManagedObject else { return nil }
            let placeEntity = PlaceEntity(mapping: managedObject)
            return placeEntity
        } catch {
            print("Failed fetching")
            return nil
        }
    }
    
    func delete(placeEntity place: PlaceEntity) {
        
    }
}
