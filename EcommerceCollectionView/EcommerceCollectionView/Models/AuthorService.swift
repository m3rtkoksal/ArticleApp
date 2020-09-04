//
//  AuthorService.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 28.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

class AuthorService: ObservableObject {
    
    @Published var authorPost = [AuthorPost]()
    
    func fetchData() {
        if let url = URL(string: "http://yazar.io/api/authors/list/") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(AuthorResults.self, from: safeData)
                            DispatchQueue.main.async {
                                self.authorPost = results.authors
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
