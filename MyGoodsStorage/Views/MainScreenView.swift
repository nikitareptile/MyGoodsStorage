//
//  MainScreenView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI
import CoreData

struct MainScreenView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: StorageEntity.entity(), sortDescriptors: [])
    private var storages: FetchedResults<StorageEntity>
    
    @State var dataViewModel = CoreDataViewModel()
    
    @State var showingAddStorageSheet = false
    @State var showingDeleteAlert = false
    
    @State var indexSetToDelete: IndexSet?
    
    var body: some View {
        List {
            Section {
                if storages.isEmpty {
                    Button {
                        showingAddStorageSheet.toggle()
                    } label: {
                        HStack {
                            Text("Add first storage")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                } else {
                    ForEach(storages) { storage in
                        NavigationLink(destination: CustomStorageView(storage: storage)) {
                            Text(storage.title!)
                        }
                    }
                    .onMove(perform: dataViewModel.moveStorage)
                    .onDelete { (indexSet) in
                        self.showingDeleteAlert.toggle()
                        self.indexSetToDelete = indexSet
                    }
                    .alert(isPresented: $showingDeleteAlert) {
                        Alert(
                            title: Text("Delete this storage?"),
                            message: Text("All inside saved products will not be deleted"),
                            primaryButton: .destructive(Text("Delete")) {
                                dataViewModel.deleteStorage(offsets: indexSetToDelete!)
                            },
                            secondaryButton: .cancel(Text("Cancel"))
                        )
                    }
                }
            } header: {
                Text("Storages")
            }
            
            Section {
                NavigationLink(destination: Text("Meal")) {
                    HStack {
                        Text("🍽️")
                        Text("Meal")
                    }
                }
                NavigationLink(destination: Text("Menu")) {
                    HStack {
                        Text("🍱")
                        Text("Menu")
                    }
                }
                NavigationLink(destination: Text("Shopping list")) {
                    HStack {
                        Text("🛒")
                        Text("Shopping list")
                    }
                }
            } header: {
                Text("Generate")
            }
            
            Section {
                NavigationLink(destination: SettingsView()) {
                    HStack {
                        Text("⚙️")
                        Text("Settings")
                    }
                }
            }
            
        }
        .navigationTitle("Home 🏠")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        .listStyle(.insetGrouped)
        .toolbar {
            if showingToolbarButtons() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showingAddStorageSheet.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddStorageSheet) {
            AddStorageView()
                .presentationDetents([.fraction(0.4)])
                .environment(\.managedObjectContext, self.viewContext)
        }
    }
    
    private func showingToolbarButtons() -> Bool {
        return !storages.isEmpty
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainScreenView()
        }
    }
}
