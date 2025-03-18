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
                ForEach(items) { item in
                    NavigationLink(destination: Text("Destination \(item.name)"), label: {
                        Text(item.name)
                    })
                } //: LOOP
                .onDelete { indexSet in
                    for index in indexSet {
                        items.remove(at: index)
                    }
                }
                .onMove { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                }
            } //: LIST
            .navigationBarTitle("Todo's", displayMode: .large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    
                    Button(action: {
                        items.append(Item(id: UUID(), name: "newly added"))
                    }, label: {
                        Image(systemName: "plus")
                    }) //: BUTTON
                }
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    Group {
        TodoListView(todoManager: TodoListManager())
    }
}
