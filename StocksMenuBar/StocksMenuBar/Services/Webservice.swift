//
//  Webservice.swift
//  StocksMenuBar
//
//  Created by Róbert Šumšala Jr. on 24/08/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

class Webservice {
    
    func getStocks(url: URL) async throws -> [Stock] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        return try JSONDecoder().decode([Stock].self, from: data)
    }
    
}
