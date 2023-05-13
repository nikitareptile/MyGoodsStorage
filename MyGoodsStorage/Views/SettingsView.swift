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
                    Text("singleUser-string")
                }
                .onChange(of: single) { newValue in
                    changeSingleDefaults(value: newValue)
                }
                if single {
                    Stepper(value: $amountOfMeals, in: 1...5) {
                        HStack {
                            Text("amountOfMeals-string")
                            Spacer()
                            TextInBlock(title: "\(amountOfMeals)")
                        }
                    }
                }
            } header: {
                Text("aboutYou-string")
            } footer: {
                if single {
                    Text("recommendedMeals-string")
                }
            }
            if !single {
                Section {
                    Stepper(value: $countOfFamilyMembers, in: 2...10) {
                        HStack {
                            Text("familyMembers-string")
                            Spacer()
                            TextInBlock(title: "\(countOfFamilyMembers)")
                        }
                    }
                    Stepper(value: $amountOfMeals, in: 1...5) {
                        HStack {
                            Text("amountOfMeals-string")
                            Spacer()
                            TextInBlock(title: "\(amountOfMeals)")
                        }
                    }
                } header: {
                    Text("aboutFamily-string")
                } footer: {
                    Text("recommendedMeals-string")
                }
                .multilineTextAlignment(.trailing)

            }

            LabeledContent("version-string", value: "0.0.1")
        }
        .navigationTitle("settingsTitle-string")
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
