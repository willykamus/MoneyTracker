//
//  FloatingButton.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-08.
//

import SwiftUI

struct FloatingButton: View {
    
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(.white)
            .padding(16)
            .background(Color.green)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)

    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
