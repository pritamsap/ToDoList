//
//  AddView.swift
//  TodoList
//
//  Created by pritam on 2024-09-06.
//

import SwiftUI

struct AddView: View {
    
   @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listviewModel: ListViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color.cyan)
                    .foregroundStyle(.white)
                    
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                })
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .navigationTitle("Add an Item")
        .padding()
    }
    
    func saveButtonPressed() {
        listviewModel.addItem(title: textFieldText)
        textFieldText = ""
        dismiss()
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
