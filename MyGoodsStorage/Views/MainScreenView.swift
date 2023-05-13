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
                            Text("addFirstStorage-string")
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
                            title: Text("deleteAlertTitle-string"),
                            message: Text("deleteAlertText-string"),
                            primaryButton: .destructive(Text("delete-string")) {
                                dataViewModel.deleteStorage(offsets: indexSetToDelete!)
                            },
                            secondaryButton: .cancel(Text("cancel-string"))
                        )
                    }
                }
            } header: {
                Text("storagesHeader-string")
            }
            
            Section {
                NavigationLink(destination: Text("Meal")) {
                    HStack {
                        Text("🍽️")
                        Text("meal-string")
                    }
                }
                NavigationLink(destination: Text("Menu")) {
                    HStack {
                        Text("🍱")
                        Text("menu-string")
                    }
                }
                NavigationLink(destination: Text("Shopping list")) {
                    HStack {
                        Text("🛒")
                        Text("shoppingList-string")
                    }
                }
            } header: {
                Text("generate-string")
            }
            
            Section {
                NavigationLink(destination: SettingsView()) {
                    HStack {
                        Text("⚙️")
                        Text("settings-string")
                    }
                }
            }
            
        }
        .navigationTitle("home-string")
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
