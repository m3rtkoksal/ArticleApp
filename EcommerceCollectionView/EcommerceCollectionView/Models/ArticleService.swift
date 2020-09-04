//
//  Service.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 25.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

class ArticleService: ObservableObject {
    
    @Published var articlePost = [ArticlePost]()
    
    let parameters = ["index": "articles"]
    
    func fetchData() {
        if let url = URL(string: "http://yazar.io/api/v2/search/") {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url:url)
            request.httpMethod = "POST"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(ArticleResults.self, from: safeData)
                            DispatchQueue.main.async {
                                self.articlePost = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

