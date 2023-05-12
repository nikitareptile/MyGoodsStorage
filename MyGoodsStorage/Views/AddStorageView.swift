//
//  AddStorageView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct AddStorageView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var dataViewModel = CoreDataViewModel()
    
    @State var newStorageTitle = ""
    @State var alertMessage = ""
    @State var showingAlert = false
    
    var body: some View {
        Form {
            Section {
                TextField("New storage name", text: $newStorageTitle)
            } header: {
                Text("")
            }
            Section {
                Button {
                    dataViewModel.addStorage(withTitle: newStorageTitle)
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Add storage")
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.blue)
        }
    }
    
    func storageTitleIsAppropriate() -> Bool {
        if newStorageTitle.count < 3 {
            alertMessage = "Name of the storage can't be less then 3 characters 😨"
            showingAlert.toggle()
            return false
        }
        return true
    }
    
}

struct AddStorageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddStorageView()
        }
    }
}
