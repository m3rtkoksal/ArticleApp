//
//  PostData.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 25.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation

struct ArticleResults: Codable {
    
    let articles: [ArticlePost]
}


struct ArticlePost: Codable, Identifiable {
    
    var id: Int {
        return article_id
    }
    let article_id: Int
    let title: String
    let author_image: String
    let author_name: String
    let article_date : String
    let article_url: String
    let newspaper: String
    let abstract: String
    let newspaper_image: String
}

