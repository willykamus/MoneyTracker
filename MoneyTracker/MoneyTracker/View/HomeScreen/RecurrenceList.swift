//
//  RecurrenceList.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-22.
//

import SwiftUI

struct RecurrenceList: View {
    
    @Binding var selectedRecurrence: Recurrence
    @Binding var recurrenceListPresented: Bool
    var recurrenceList: [Recurrence] = Recurrence.allCases
    
    var body: some View {
        List(self.recurrenceList, id: \.self) { recurrence in
            Button(RecurrenceMapper().value(recurrence: recurrence)) {
                self.selectedRecurrence = recurrence
                self.recurrenceListPresented.toggle()
            }
        }
    }
}

struct RecurrenceList_Previews: PreviewProvider {
    static var previews: some View {
        RecurrenceList(selectedRecurrence: .constant(.never), recurrenceListPresented: .constant(true))
    }
}
