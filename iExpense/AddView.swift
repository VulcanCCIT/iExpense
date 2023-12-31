//
//  AddView.swift
//  iExpense
//
//  Created by Chuck Condron on 6/21/23.
//

import SwiftUI

struct AddView: View {
  @ObservedObject var expenses: Expenses
  @Environment(\.dismiss) var dismiss
  
  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = 0.0
  
  let types = ["Business", "Personal"]
  
  //below was removed based on Paul's solution and moved to FormatStyle-LocalCurrency.swift as an extension
  
  //  let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        
        Picker("Type", selection: $type) {
          ForEach(types, id: \.self) {
            Text($0)
          }
        }
        
        TextField("Amount", value: $amount, format: .localCurrency)
          .keyboardType(.decimalPad)
      }
      .navigationTitle("Add new expense")
      .toolbar {
        Button("Save") {
          let item = ExpenseItem(name: name, type: type, amount: amount)
          expenses.items.append(item)
          dismiss()
        }
      }
    }
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(expenses: Expenses())
  }
}
