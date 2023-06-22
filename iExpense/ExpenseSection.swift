//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Chuck Condron on 6/22/23.
//

//Code below based on Paul's solution which simplifies ContentView

import SwiftUI

struct ExpenseSection: View {
  let title: String
  let expenses: [ExpenseItem]
  let deleteItems: (IndexSet) -> Void
  
  var body: some View {
    Section(title) {
      ForEach(expenses) { item in
        HStack {
          VStack(alignment: .leading) {
            Text(item.name)
              .font(.headline)
            Text(item.type)
          }
          
          Spacer()
          
          Text(item.amount, format: .localCurrency)
            .style(for: item)
            .fontWeight(.bold)
        }
      }
      .onDelete(perform: deleteItems)
    }
  }
}

struct ExpenseSection_Previews: PreviewProvider {
  static var previews: some View {
    ExpenseSection(title: "Example", expenses: []) { _ in }
  }
}
