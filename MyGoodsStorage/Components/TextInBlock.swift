//
//  TextInBlock.swift
//  MyGoodsStorage
//
//  Created by Никита Тихонюк on 13.05.2023.
//

import SwiftUI

struct TextInBlock: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(.gray.opacity(0.14))
            .cornerRadius(8)
            .multilineTextAlignment(.center)
    }
}
