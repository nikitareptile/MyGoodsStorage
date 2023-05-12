//
//  RootView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            if UserDefaults.standard.bool(forKey: "wasLaunched") {
                MainScreenView()
            } else {
                WelcomeView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RootView()
        }
    }
}
