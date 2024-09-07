//
//  ListRowView.swift
//  TodoList
//
//  Created by pritam on 2024-09-06.
//

import SwiftUI

struct ListRowView: View {
    
    
    let item: ItemModel
    
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ?   "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    var item1 = ItemModel(title: "First Item", isCompleted: false)
    var item2 = ItemModel(title: "Second Item", isCompleted: true)

    return Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
