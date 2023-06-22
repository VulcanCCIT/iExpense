//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Chuck Condron on 6/22/23.
//

import SwiftUI

//extension based on Paul's solution allowing a consistent use of formatters for the app.  You can use it like this:
//Text(item.amount, format: .localCurrency)
//  .style(for: item)


extension View {
  func style(for item: ExpenseItem) -> some View {
    switch item.amount {
    case 0..<20:
      return self.foregroundColor(.green)
    case 20..<51:
      return self.foregroundColor(.blue)
    default:
      return self.foregroundColor(.red)
    }
  }
}
