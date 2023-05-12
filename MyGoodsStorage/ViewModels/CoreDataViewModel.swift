//
//  CoreDataViewModel.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let manager = PersistenceController.instance
    @Published var storages: [StorageEntity] = []
    @Published var products: [ProductEntity] = []
    
    init() {
        getStorages()
    }
    
    func getStorages() {
        let request = NSFetchRequest<StorageEntity>(entityName: "StorageEntity")
        
        do {
            storages = try manager.context.fetch(request)
            print("Successfully get all storages.")
        } catch let error {
            print("Error getting the storage. \n\(error.localizedDescription)")
        }
    }
    
    func addStorage(withTitle: String) {
        withAnimation {
            let newStorage = StorageEntity(context: manager.context)
            newStorage.order = (storages.last?.order ?? 0) + 1
            newStorage.title = withTitle
            saveChanges()
        }
    }
    
    func moveStorage(from: IndexSet, to destination: Int) {
        let storageToMove = from.first!
        if storageToMove < destination {
            var startIndex = storageToMove + 1
            let endIndex = destination + 1
            var startOrder = storages[storageToMove].order
            while startIndex <= endIndex {
                startOrder += 1
                startIndex += 1
            }
            storages[storageToMove].order = startOrder
        } else if destination < storageToMove {
            var startIndex = destination
            let endIndex = storageToMove - 1
            var startOrder = storages[destination].order + 1
            let newOrder = storages[destination].order
            while startIndex <= endIndex {
                storages[startIndex].order = startOrder
                startOrder += 1
                startIndex += 1
            }
            storages[storageToMove].order = newOrder
        }
        saveChanges()
    }
    
    func deleteStorage(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let storageEntity = storages[index]
            manager.context.delete(storageEntity)
            saveChanges()
        }
    }
    
    func saveChanges() {
        manager.saveData()
        getStorages()
    }
    
}
