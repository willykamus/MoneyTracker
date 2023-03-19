//
//  TransactionRowView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-12-16.
//

import SwiftUI

struct TransactionRowView: View {
    
    @State var transaction: Transaction
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                
                Text(String(transaction.category))
                     
                Text(dateString(date:transaction.date))
                    .font(.system(size: 8, weight: .light))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(String(transaction.amount))
                .foregroundColor(.gray)
        }
    }
                     
    private func dateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
                     
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView(transaction: Transaction(id: "", amount: 0.0, category: "", date: Date(), containerId: "", containerName: "", type: .income))
    }
}
