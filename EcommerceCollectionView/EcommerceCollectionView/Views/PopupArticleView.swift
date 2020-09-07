//
//  AlertView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 1.09.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct PopupArticleView: View {
    @Binding var isShown: Bool
    @State var isModalShown: Bool = false
    var articlePost: ArticlePost
    @State var viewState = CGSize.zero
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                ZStack{
                    Rectangle()
                        .frame( height: 168)
                        .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.8196078431, blue: 1, alpha: 1)))
                    URLImage(url: articlePost.newspaper_image)
                        .frame(width: 150, height: 125)
                }
                HStack(spacing: UIScreen.main.bounds.size.width / 1.8) {
                    Text(articlePost.newspaper)
                        .frame( alignment: .leading)
                        .opacity(0.5)
                    Text(articlePost.article_date)
                        .frame(alignment: .trailing)
                        .opacity(0.5)
                }
                .font(.custom("SF-Pro", size: 11))
                Text(articlePost.title)
                    .frame(width: 300, height: 80, alignment: .leading)
                    .font(.custom("SF-Pro", size: 20))
                    .padding(.horizontal, 24)
                Text(articlePost.abstract)
                    .frame(width: 300, height: 80, alignment: .leading)
                    .font(.custom("SF-Pro", size: 13))
                    .lineSpacing(1)
                    .lineLimit(4)
                HStack(spacing: UIScreen.main.bounds.size.width / 2.9){
                    Button(action: {
                        print("button tapped")
                    }) {
                        HStack{
                            URLImage(url: articlePost.author_image)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 32, height: 32)
                                .edgesIgnoringSafeArea(.leading)
                                .cornerRadius(16)
                                
                            Text(articlePost.author_name)
                                .font(.custom("SF-Pro", size: 11))
                            .lineLimit(2)
                        }
                    }
                    
                    Button("Oku →") {
                        self.isModalShown.toggle()
                        self.isShown.toggle()
                    }
                    .font(.custom("SF-Pro", size: 11))
                    .foregroundColor(.blue)
                    .sheet(isPresented: $isModalShown, content: {WebView(urlString: self.articlePost.article_url)})
                }
            }
            .background(Color(UIColor.secondarySystemBackground))
            .gesture(DragGesture().onChanged({ (value) in
                if self.isShown == true {
                    self.viewState = value.translation
                }
            }).onEnded({ (value) in
                if self.viewState.height >= 170 {
                    self.isShown = false
                }
                self.viewState = .zero
            }))
                .cornerRadius(20)
        }
        .offset(y: isShown ? .zero : UIScreen.main.bounds.size.height)
        .offset(y: viewState.height)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        //        AlertView(isShown: .constant(false), articlePost: .constant(ArticlePost(article_id: 0, title: "amamama", author_image: "3", author_name: "Mustafa", article_date: "Bugun", article_url: "www", newspaper: "Sabah", abstract: "Oyle boyle", newspaper_image: "")))
        
        PopupArticleView(isShown: .constant(false), articlePost: ArticlePost(article_id: 0, title: "", author_image: "", author_name: "", article_date: "", article_url: "", newspaper: "", abstract: "", newspaper_image: ""))
    }
}
