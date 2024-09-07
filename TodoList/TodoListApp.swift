//
//  TodoListApp.swift
//  TodoList
//
//  Created by pritam on 2024-09-06.
//

import SwiftUI

/*
 MVVM Architecture
 Model - data point
 View - OUR UI
 ViewModel - manages model for our view
 */

@main
struct TodoListApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack {
                ListView()

            }.environmentObject(listViewModel)
        }
    }
}
