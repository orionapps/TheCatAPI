//
//  Service.swift
//  TheCatAPI
//
//  Created by Aleksandrs Muravjovs on 21/05/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    
    func getData(completion: @escaping([CatModel])->()) throws {
        
        let randomPage = Int.random(in: 0 ... 100)
        
        let jsonUrlString = URL(string: "https://api.thecatapi.com/v1/images/search?mime_types=jpg,png&limit=40&page=\(randomPage)&order=DESC")
        
            if let unwrappedURL = jsonUrlString {
                
                var urlRequest = URLRequest(url: unwrappedURL)
                urlRequest.addValue("4c5cd158-8c01-4caf-80df-d3340be3d13d", forHTTPHeaderField: "x-api-key")
                
                
                URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    
                    guard let data = data else { print("error- data is nil"); return }
                    
                    if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                        print(JSONString)
                    }
                    
                    do {
                        let catArray =  try JSONDecoder().decode([CatModel].self, from: data)
                        completion(catArray)

                    } catch let error {
                        print(error)
                    }
                    
                    }.resume()
        }
        
        }
    }



