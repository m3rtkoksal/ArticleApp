//
//  AuthorListElementView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 28.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct AuthorListElementView: View {
    @State var isModalShow = false
    var authorPost: AuthorPost
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("\(authorPost.author_name)")
                        .fontWeight(.ultraLight)
                        .frame(alignment: .leading)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .padding(.vertical,5)
                    Text("- \(authorPost.read_count) reads")
                        .fontWeight(.ultraLight)
                        .frame( alignment: .trailing)
                        .foregroundColor(.gray)
                }
                .font(.custom("SF-Pro-Text_Thin", size: 13))
                .font(.custom("SF-Pro", size: 11))
            }
            .frame(minWidth: 130, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity, alignment: .leading)
            Spacer()
            
            URLImage(url: authorPost.author_image)
                .frame(width: 109, height: 109)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .cornerRadius(10)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .padding()
        .background(Color(UIColor.tertiarySystemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, y: 10)
        .padding(3)
        
        .onTapGesture {
            self.isModalShow = true
        }
//        .sheet(isPresented: $isModalShow, content: { WebView(urlString: self.authorPost.author_url)})

    }
}

struct AuthorListElementView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorListElementView(authorPost: AuthorPost(author_id: 0, author_image: "", author_name: "", author_url: "", read_count: ""))
    }
}
