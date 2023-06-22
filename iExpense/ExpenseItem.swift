//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Chuck Condron on 6/21/23.
//

import Foundation

//added Equatable based on Paul's solution...this allows Swift to generate the Equatable conformance for us, and it does that by comparing every property against every other property. In practice, this will return false as soon as one property – our id – is not the same, so it will be very efficient.

struct ExpenseItem: Identifiable, Codable, Equatable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Double
}

