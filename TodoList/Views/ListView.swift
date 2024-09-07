//
//  ListView.swift
//  TodoList
//
//  Created by pritam on 2024-09-06.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
               ListRowView(item: item)
                
            }
            .onDelete(perform:  listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
            
        }.listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
    
   
    
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())

}


