//
//  ContentView.swift
//  StocksMenuBar
//
//  Created by Róbert Šumšala Jr. on 23/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm: StockListViewModel
    
    init(vm: StockListViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stocks").padding()
            
            List(vm.stocks, id: \.symbol) { stock in
                HStack(alignment: .center) {
                    VStack(alignment: .leading){
                        Text(stock.symbol)
                            .fontWeight(.semibold)
                        Text(stock.description)
                            .opacity(0.4)
                    }
                    
                    Spacer()
                    Text(stock.price.formatAsCurrency())
                }
            }.task {
                await vm.populateStocks()
            }
        }.frame(width: 300, height: 300)
    }
}


