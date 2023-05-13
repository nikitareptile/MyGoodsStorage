//
//  AddProductView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var newProductName = ""
    @State var newProductGroup = "Vegetables"
    let groupOptions: [String] = [
        "Vegetables", "Fruits", "Liquids", "Other",
    ]
    @State var newProductMeasure = "Kilograms"
    let measureOptions: [String] = [
        "Kilograms", "Grams", "Items", "Liters"
    ]
    @State var newProductCount = 1
    @State var isNewProductFavorite = false
    
    var body: some View {
        Form {
            Section {
                TextField("productName-string", text: $newProductName)
                Picker(selection: $newProductGroup) {
                    ForEach(groupOptions, id: \.self) { group in
                        Text(group).tag(group)
                    }
                } label: {
                    Text("productType-string")
                }
                Picker(selection: $newProductMeasure) {
                    ForEach(measureOptions, id: \.self) { measure in
                        Text(measure).tag(measure)
                    }
                } label: {
                    Text("productMeasure-string")
                }
                Stepper(value: $newProductCount, in: 1...10000) {
                    TextField(
                        "\(newProductCount)",
                        value: $newProductCount,
                        formatter: NumberFormatter()
                    )
                    .keyboardType(.numberPad)
                }
            } header: {
                Text("")
            }
            Section {
                Toggle(isOn: $isNewProductFavorite) {
                    Text("favorite-string")
                }
            }
            Section {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("addProduct-string")
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.blue)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProductView()
        }
    }
}
