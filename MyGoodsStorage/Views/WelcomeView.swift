//
//  WelcomeView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    let userUniqID = UUID().uuidString
    
    var body: some View {
        VStack {
            Text("welcome-string")
                .font(.title)
                .padding(.top, screenHeight * 0.08)
            Text("Goods Storage")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, screenHeight * 0.08)
            WelcomeScreenText(
                icon: "👀",
                title: "welcomeFirstTitle-string",
                subTitle: "welcomeFirstSubtitle-string")
            WelcomeScreenText(
                icon: "🍱",
                title: "welcomeSecondTitle-string",
                subTitle: "welcomeSecondSubtitle-string")
            WelcomeScreenText(
                icon: "🍽️",
                title: "welcomeThirdTitle-string",
                subTitle: "welcomeThirdSubtitle-string")
            Spacer()
            Button {
                UserDefaults.standard.set(true, forKey: "wasLaunched")
            } label: {
                NavigationLink(destination: MainScreenView()) {
                    Text("continue-string")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 55)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
            }
        }
        .padding()
        .onAppear {
            setDefaults()
        }
    }
    
    private func setDefaults() {
        UserDefaults.standard.set(true, forKey: "isUserSingle")
        UserDefaults.standard.set(userUniqID, forKey: "userID")
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
