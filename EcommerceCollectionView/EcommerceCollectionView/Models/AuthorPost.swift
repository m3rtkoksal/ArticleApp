//
//  AuthorPost.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 28.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

struct AuthorResults: Decodable {
    
    let authors: [AuthorPost]
}


struct AuthorPost: Decodable, Identifiable {
    
    var id: Int {
        return author_id
    }
    let author_id: Int
    let author_image: String
    let author_name: String
    let author_url: String
    let read_count: String
    
    
}
