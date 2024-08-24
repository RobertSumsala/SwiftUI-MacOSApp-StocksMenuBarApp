//
//  Stock.swift
//  StocksMenuBar
//
//  Created by Róbert Šumšala Jr. on 24/08/2024.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
}
