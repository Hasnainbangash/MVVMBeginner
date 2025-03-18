//
//  MVVMBeginnerApp.swift
//  MVVMBeginner
//
//  Created by Elexoft on 17/03/2025.
//

import SwiftUI

@main
struct MVVMBeginnerApp: App {
    
    @StateObject var todoManager = TodoListManager()
    
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManager)
        }
    }
}
