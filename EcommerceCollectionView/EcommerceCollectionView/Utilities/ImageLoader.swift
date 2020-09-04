//
//  ImageLoader.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 27.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published
     
    var downloadedImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            self.downloadedImage = UIImage(data:data)
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }.resume()
    }
}
