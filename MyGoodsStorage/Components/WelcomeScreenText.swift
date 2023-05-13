//
//  WelcomeScreenText.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 12.05.2023.
//

import SwiftUI

struct WelcomeScreenText: View {
    
    @State var screenWidth: CGFloat = UIScreen.main.bounds.width
    @State var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    let icon: String
    let title: LocalizedStringKey
    let subTitle: LocalizedStringKey
    
    var body: some View {
        HStack(spacing: 20) {
            Text(icon)
                .font(.system(size: 50))
                .padding(.leading, screenWidth * 0.08)
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                Text(subTitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.vertical, 18)
        .frame(maxWidth: screenWidth * 0.86)
    }
}
