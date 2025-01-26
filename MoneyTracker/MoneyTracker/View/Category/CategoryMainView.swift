//
//  CategoryMainView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-14.
//

import SwiftUI
import SwiftData

struct CategoryMainView: View {
    
    @Environment(\.modelContext) private var context
    @StateObject var categoryMainViewModel: CategoryMainViewModel = CategoryMainViewModel()
    @Query(animation: .snappy) private var categories: [Category]

    
    @State var isPresented: Bool = false
    @State var categoryName: String = ""
    @State var selectedType: TransactionType = .expense
    
    var body: some View {
        NavigationStack {
            ZStack {
                if categoryMainViewModel.categorySections.isEmpty {
                    ContentUnavailableView("No category created", systemImage: "tray.fill")
                } else {
                    List {
                        ForEach(categoryMainViewModel.categorySections, id: \.self) { section in
                            Section {
                                ForEach(section.categories) { category in
                                    Text(category.name)
                                }
                            } header: {
                                Text(section.title)
                            }
                        }
                    }
                    .listSectionSpacing(.compact)
                    .overlay {
                        if categoryMainViewModel.categorySections.isEmpty {
                            ContentUnavailableView(label: {
                                Label("No categories", systemImage: "tray.fill")
                            })
                        }
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
            .onAppear {
                categoryMainViewModel.intialize(contex: self.context)
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
                                categoryMainViewModel.intialize(contex: self.context)
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
