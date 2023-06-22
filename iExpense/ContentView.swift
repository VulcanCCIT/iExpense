//
//  ContentView.swift
//  iExpense
//
//  Created by Chuck Condron on 6/20/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var expenses = Expenses()
  @State private var showingAddExpense = false
  
  let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
  
  var body: some View {
    
    NavigationView {
      Form {
        Section(header: Text("Personal")) {
          List {
            ForEach(expenses.items) { item in
              if item.type == "Personal" {
                HStack {
                  VStack(alignment: .leading) {
                    Text(item.name)
                      .font(.headline)
                  }
                  
                  Spacer()
                  
                  Text(item.amount, format:localCurrency)
                    .foregroundColor(colorToUse(amount: item.amount))
                    .fontWeight(.bold)
                }
              }
            }
            .onDelete(perform: removeItems)
          }
        }
        
        Section(header: Text("Business")) {
          List {
            ForEach(expenses.items) { item in
              if item.type == "Business" {
                HStack {
                  VStack(alignment: .leading) {
                    Text(item.name)
                      .font(.headline)
                  }
                  
                  Spacer()
                  
                  Text(item.amount, format:localCurrency)
                    .foregroundColor(colorToUse(amount: item.amount))
                    .fontWeight(.bold)
                }
              }
            }
            .onDelete(perform: removeItems)
          }
        }
        
        .navigationTitle("iExpense")
      }
      .toolbar {
        Button {
          showingAddExpense = true
        } label: {
          Image(systemName: "plus")
        }
        .sheet(isPresented: $showingAddExpense) {
          AddView(expenses: expenses)
        }
      }
    }
  }
  
  func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
  
  func colorToUse(amount: Double) -> Color {
    
    switch amount {
    case 0..<20:
      return .green
    case 20..<51:
      return .blue
    default:
      return .red
    }
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
