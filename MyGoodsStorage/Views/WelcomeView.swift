//
//  WelcomeView.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Text("Welcome to")
                .font(.title)
                .padding(.top, screenHeight * 0.08)
            Text("Goods Storage")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, screenHeight * 0.08)
            WelcomeScreenText(
                icon: "👀",
                title: "Keep an eye",
                subTitle: "Add and remove products in your home.")
            WelcomeScreenText(
                icon: "🍱",
                title: "Generate a menu",
                subTitle: "Don't think about what to cook.")
            WelcomeScreenText(
                icon: "🍽️",
                title: "Save time",
                subTitle: "Choose recipes from the products you have.")
            Spacer()
            Button {
                UserDefaults.standard.set(true, forKey: "wasLaunched")
            } label: {
                NavigationLink(destination: MainScreenView()) {
                    Text("Continue")
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
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
