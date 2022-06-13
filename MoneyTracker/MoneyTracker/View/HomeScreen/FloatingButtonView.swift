//
//  FloatingButtonView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct FloatingButtonView: View {
    var body: some View {
        VStack {
            Label(
                title: { Text("Create") },
                icon: { Image(systemName: "plus.circle") })
        }
        .foregroundColor(Color.white)
        .padding(.horizontal,12)
        .padding(.vertical, 6)
        .background(Color.blue)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonView()
    }
}
