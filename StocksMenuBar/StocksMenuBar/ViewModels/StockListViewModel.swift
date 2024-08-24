//
//  StockListViewModel.swift
//  StocksMenuBar
//
//  Created by Róbert Šumšala Jr. on 24/08/2024.
//

import Foundation

@MainActor
class StockListViewModel: ObservableObject {
    
    @Published var stocks: [StockViewModel] = []
    
    
    func populateStocks() async {
        
        do {
            let stocks = try await Webservice().getStocks(url: Constants.URLs.latestStocks)
            self.stocks = stocks.map(StockViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
}


struct StockViewModel {
    
    private var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    var symbol: String {
        stock.symbol
    }
    
    var description: String {
        stock.description
    }
    
    var price: Double {
        stock.price
    }
    
}
