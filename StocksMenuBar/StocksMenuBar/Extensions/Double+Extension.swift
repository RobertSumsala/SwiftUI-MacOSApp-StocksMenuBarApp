//
//  Double+Extension.swift
//  StocksMenuBar
//
//  Created by Róbert Šumšala Jr. on 24/08/2024.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: self)) ?? "N/A"
        
    }
    
}
