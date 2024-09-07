//
//  ListViewModel.swift
//  TodoList
//
//  Created by pritam on 2024-09-06.
//

import Foundation


class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        let newItems = [
            ItemModel(title: "First Item", isCompleted: true),
            ItemModel(title: "Second Item", isCompleted: true),
            ItemModel(title: "Third Item", isCompleted: false)

            ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
