//
//  MyGoodsStorageApp.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

@main
struct MyGoodsStorageApp: App {
    let persistenceController = PersistenceController.instance

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
