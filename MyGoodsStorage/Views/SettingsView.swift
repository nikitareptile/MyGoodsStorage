//
//  SettingsView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var single = UserDefaults.standard.bool(forKey: "isUserSingle")
    @State var countOfFamilyMembers = 2
    @State var amountOfMeals = 3
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $single) {
                    Text("Single")
                }
                .onChange(of: single) { newValue in
                    changeSingleDefaults(value: newValue)
                }
                if single {
                    Stepper(value: $amountOfMeals, in: 1...5) {
                        HStack {
                            Text("Amount of meals")
                            Spacer()
                            TextInBlock(title: "\(amountOfMeals)")
                        }
                    }
                }
            } header: {
                Text("About you")
            } footer: {
                if single {
                    Text("4-5 count of meals recommended")
                }
            }
            if !single {
                Section {
                    Stepper(value: $countOfFamilyMembers, in: 2...10) {
                        HStack {
                            Text("Family members")
                            Spacer()
                            TextInBlock(title: "\(countOfFamilyMembers)")
                        }
                    }
                    Stepper(value: $amountOfMeals, in: 1...5) {
                        HStack {
                            Text("Amount of meals")
                            Spacer()
                            TextInBlock(title: "\(amountOfMeals)")
                        }
                    }
                } header: {
                    Text("About family")
                } footer: {
                    Text("4-5 amount of meals recommended")
                }
                .multilineTextAlignment(.trailing)

            }

            LabeledContent("Version", value: "0.01")
        }
        .navigationTitle("Settings ⚙️")
    }
    
    private func changeSingleDefaults(value: Bool) {
        UserDefaults.standard.set(value, forKey: "isUserSingle")
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
