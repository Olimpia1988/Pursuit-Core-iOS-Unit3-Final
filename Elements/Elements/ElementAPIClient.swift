//
//  ElementAPIClient.swift
//  Elements
//
//  Created by Olimpia on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class ElementAPIClient {
    static func getData(completionHandler: @escaping((AppError?, [Elements.ElementInfo]?) -> Void)) {
    
    let urlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: urlString) else {
            completionHandler(AppError.badURL("Bad URL"), nil)
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error),nil)
            } else if let data = data {
                do {
                    let getData = try JSONDecoder().decode([Elements.ElementInfo].self, from: data)
                    completionHandler(nil, getData)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }.resume()
       
    }
}
