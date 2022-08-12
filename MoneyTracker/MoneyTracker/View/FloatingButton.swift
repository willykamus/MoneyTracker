//
//  FloatingButton.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-08.
//

import SwiftUI

struct FloatingButton: View {
    
    var action: () ->()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
                .padding(16)
                .background(Color.green)
                .clipShape(Circle())
        }

        
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(action: { print("Hello")})
    }
}
