//
//  ContentView.swift
//  MVVMBeginner
//
//  Created by Elexoft on 17/03/2025.
//

import SwiftUI

struct TodoListView: View {
    // MARK: - PROPERTIES
    
    @ObservedObject var todoManager: TodoListManager
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoManager.items) { item in
                    NavigationLink(destination: Text("Destination \(item.name)"), label: {
                        Text(item.name)
                    })
                } //: LOOP
                .onDelete { indexSet in
                    todoManager.delete(at: indexSet)
                }
                .onMove { indices, newOffset in
                    todoManager.move(indices: indices, newOffset: newOffset)
                }
            } //: LIST
            .navigationBarTitle("Todo's", displayMode: .large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    
                    Button(action: {
                        todoManager.addItem()
                    }, label: {
                        Image(systemName: "plus")
                    }) //: BUTTON
                }
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

// Empty State Preview with no data exists in item list
#Preview("Empty State") {
    TodoListView(todoManager: TodoListManager.emptyState())
}

// Full State Preview with data exists in item list
#Preview("Data Exits") {
    TodoListView(todoManager: TodoListManager.fullState())
}
