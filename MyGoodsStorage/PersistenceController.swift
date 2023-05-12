//
//  PersistenceController.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import CoreData

struct PersistenceController {
    
    static let instance = PersistenceController()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    init() {
        container = NSPersistentContainer(name: "GoodsStorageContainer")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error as NSError? {
                print("Can't load Core Data. \n\(error)")
            } else {
                print("Successfully loaded Core Data.")
            }
        })
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try context.save()
            print("Saved successfully!")
        } catch let error {
            print("Can't save data. \n\(error.localizedDescription)")
        }
    }
    
}
