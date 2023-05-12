//
//  CustomStorageView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct CustomStorageView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let storage: StorageEntity
    
    @FetchRequest(entity: ProductEntity.entity(), sortDescriptors: [])
    private var products: FetchedResults<ProductEntity>
    
    @State var showingAddProductSheet = false
    
    var body: some View {
        List {
            if products.isEmpty {
                Button {
                    showingAddProductSheet.toggle()
                } label: {
                    HStack {
                        Text("Add first product")
                        Spacer()
                        Image(systemName: "plus")
                    }
                }

            }
        }
        .navigationTitle(storage.title ?? "Error")
        .sheet(isPresented: $showingAddProductSheet) {
            AddProductView()
                .environment(\.managedObjectContext, self.viewContext)
        }
    }
}
//
//struct CustomStorageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            CustomStorageView()
//        }
//    }
//}
