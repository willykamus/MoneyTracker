//
//  CategoryMainView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-14.
//

import SwiftUI
import SwiftData

struct CategoryMainView: View {
    @Query(animation: .snappy) private var categories: [Category]
    @Environment(\.modelContext) private var context
    
    @State var isPresented: Bool = false
    @State var categoryName: String = ""
    @State var selectedType: TransactionType = .expense
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(categories) { category in
                        Section {
                            Text(category.name)
                        }
                    }

                }
                .listSectionSpacing(.compact)
                .overlay {
                    if categories.isEmpty {
                        ContentUnavailableView(label: {
                            Label("No categories", systemImage: "tray.fill")
                        })
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            self.isPresented = true
                        } label: {
                            FloatingButton()
                        }
                        .padding(.horizontal,32)
                        .padding(.vertical,16)
                    }
                }
            }
            .navigationTitle("Categories")
            .sheet(isPresented: self.$isPresented, onDismiss: {
                self.categoryName = ""
            }, content: {
                NavigationStack {
                    List {
                        Section {
                            TextField("Title", text: self.$categoryName)
                        }
                        Section {
                            HStack {
                                Text("Expense type")
                                Spacer()
                                Menu(self.selectedType.rawValue.capitalized) {
                                    ForEach(TransactionType.allCases, id: \.self) { type in
                                        Button {
                                            self.selectedType = type
                                        } label: {
                                            Text(type.rawValue.capitalized)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Category")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                let category = Category(type: self.selectedType, name: self.categoryName, budgetAmount: 0)
                                context.insert(category)
                            }, label: {
                                Text("Add")
                            })
                            .disabled(categoryName.isEmpty)
                        }
                    }
                }
                .presentationDetents([.height(250)])
            })
        }
    }
}

#Preview {
    CategoryMainView()
}
