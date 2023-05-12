//
//  SettingsView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var single = false
    @State var countOfFamilyMembers = 2
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $single) {
                    Text("Single")
                }
                
            } header: {
                Text("About you")
            }
            
            if !single {
                Section {
                    HStack {
                        Text("Family members")
                        TextField(
                            "\(countOfFamilyMembers)",
                            value: $countOfFamilyMembers,
                            formatter: NumberFormatter()
                        )
                        .multilineTextAlignment(.trailing)
                    }
                } header: {
                    Text("About family")
                }
            }

            LabeledContent("Version", value: "0.01")
        }
        .navigationTitle("Settings ⚙️")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
