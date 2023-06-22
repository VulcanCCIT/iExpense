//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Chuck Condron on 6/21/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Double
}

