//
//  TodoListManager.swift
//  MVVMBeginner
//
//  Created by Elexoft on 18/03/2025.
//

import Foundation

class TodoListManager: ObservableObject {
    @Published var items: [Item] = [
        Item(id: UUID(), name: "first"),
        Item(id: UUID(), name: "second"),
        Item(id: UUID(), name: "third")
    ]
    
    init() {
        //get my data and set to my items array
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
}
