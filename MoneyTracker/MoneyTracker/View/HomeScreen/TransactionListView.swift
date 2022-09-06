//
//  TransactionListView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct TransactionListView: View {
    
    @State var createTransactionOpened: Bool = false
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.createTransactionOpened.toggle()
                    }, label: {
                        FloatingButton()
                    })
                }
                .padding(.bottom,20)
                .padding(.horizontal,20)
                
            }
            .sheet(isPresented: self.$createTransactionOpened) {
                print("Dismiss")
            } content: {
                CreateTransactionView(createTransactionOpened: self.$createTransactionOpened)
            }

        }
        
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
