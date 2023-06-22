//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Chuck Condron on 6/22/23.
//

import Foundation

//This modifies the FormatStyle protocol used by SwiftUI’s formatters, but only in the situation where we’re using a currency formatter.

//Rather than writing localCurrency we can use .localCurrency to access the shared value. Make sure and do this in both places it occurs!



extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
  static var localCurrency: Self {
    .currency(code: Locale.current.currency?.identifier ?? "USD")
  }
}
