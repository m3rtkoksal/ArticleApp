//
//  ListElementView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 25.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct ArticleListElementView: View {
    var articlePost: ArticlePost
    var body: some View {
        ZStack {
            HStack {
                URLImage(url: articlePost.author_image)
                    .frame(width: 117, height: 128)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.leading)
                    .mask(RoundedCorners( tl: 15, bl: 15))
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text(articlePost.newspaper)
                            .font(.custom("SF-Pro", size: 11))
                        Spacer()
                            .frame(width: 15)
                        Text(articlePost.article_date)
                            .font(.custom("SF-Pro", size: 11))
                            .fontWeight(.ultraLight)
                            .foregroundColor(.gray)
                            .padding(.vertical,13)
                            .padding(.horizontal,5)
                            .frame( maxWidth: .infinity, alignment: .trailing)
                    }
                    .lineSpacing(13)
                    VStack(alignment: .leading, spacing: 17) {
                        Text(articlePost.title)
                            .font(.headline)
                            .font(.custom("SF-Pro", size: 17))
                            .frame( maxWidth: 280, maxHeight: 60, alignment: .leading)
                        Text("\(articlePost.author_name)")
                            .fontWeight(.ultraLight)
                            .frame(alignment: .bottomLeading)
                            .foregroundColor(.gray)
                            .padding(.vertical,10)
                            .font(.custom("SF-Pro", size: 11))
                    }
                }
                .padding(.horizontal,20)
//                            .frame(minWidth: 130, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .leading)
            }
            .background(Color(red: 229, green: 229, blue: 229))
            .frame(minWidth: 335, maxWidth: .infinity, minHeight: 128, maxHeight: .infinity, alignment: .leading)
            .edgesIgnoringSafeArea(.all)
            .cornerRadius(15)
            .padding(.horizontal, 20)
        }
    }

}

struct ListElementView_Previews: PreviewProvider {
    static var previews: some View {
        
        ArticleListElementView(articlePost: ArticlePost(article_id: 0, title: "Kose yazisi basligi buraya gelecek max 2 satir", author_image: "1", author_name: "Yazar adi", article_date: "Bugun", article_url: "", newspaper: "Sabah", abstract: "hananove", newspaper_image: ""))
        
    }
}
