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
  
  //below was removed based on Paul's solution and moved to FormatStyle-LocalCurrency.swift as an extension
  
  //  let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
  
  var body: some View {
    
    //New  ContentView is just a matter of using ExpenseSection twice:
    
    NavigationView {
      List {
        ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
        ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
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
  
  //  func removeItems(at offsets: IndexSet) {
  //    expenses.items.remove(atOffsets: offsets)
  //  }
  
  //Removed the original removeItems as it doesn't know if you deleted an item from the personal array or the business array.  We need to update the removeItems() method so that it knows which input array it’s reading from – personal items or business items. This will then create a new IndexSet by locating each item in the full array, and delete them in bulk using remove(atOffsets:) like before:
  
  func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
    var objectsToDelete = IndexSet()
    
    for offset in offsets {
      let item = inputArray[offset]
      
      if let index = expenses.items.firstIndex(of: item) {
        objectsToDelete.insert(index)
      }
    }
    
    expenses.items.remove(atOffsets: objectsToDelete)
  }
  
  //We need to wrap that in two simpler methods that SwiftUI can call directly from onDelete():
  
  func removePersonalItems(at offsets: IndexSet) {
    removeItems(at: offsets, in: expenses.personalItems)
  }
  
  func removeBusinessItems(at offsets: IndexSet) {
    removeItems(at: offsets, in: expenses.businessItems)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
