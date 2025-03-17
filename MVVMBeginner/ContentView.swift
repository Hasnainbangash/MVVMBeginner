//
//  ContentView.swift
//  MVVMBeginner
//
//  Created by Elexoft on 17/03/2025.
//

import SwiftUI

// MARK: - ITEM MODEL

struct Item: Identifiable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State var items: [Item] = [
        Item(id: UUID(), name: "first"),
        Item(id: UUID(), name: "second"),
        Item(id: UUID(), name: "third")
    ]
    
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
    ContentView()
}
