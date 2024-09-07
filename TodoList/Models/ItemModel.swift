//
//  ItemModel.swift
//  TodoList
//
//  Created by pritam on 2024-09-06.
//

import Foundation

struct ItemModel: Identifiable {    
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
