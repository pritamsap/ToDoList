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
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
        
        .alert(isPresented: $showAlert, content: getAlert)
        .padding()
    }
    
    func saveButtonPressed() {
        if textIsVerified() {
            listviewModel.addItem(title: textFieldText)
            textFieldText = ""
            dismiss()
        }
        
      
    }
    
    
    func textIsVerified() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new item must be atleast 3 character long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() ->  Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
