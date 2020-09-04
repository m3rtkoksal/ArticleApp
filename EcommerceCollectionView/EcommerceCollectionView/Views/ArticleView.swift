//
//  ArticleView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 28.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    @ObservedObject var service = ArticleService()
    @State private var selectedTab = 0
    @State var shown: Bool = false
    @State var isProfileViewPresented = false
    @State var selectedArticle = ArticlePost(article_id: 0, title: "", author_image: "", author_name: "", article_date: "", article_url: "", newspaper: "", abstract: "", newspaper_image: "")
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {

                        ForEach(service.articlePost, id: \.article_id) { post in
                            ArticleListElementView(articlePost: post)
                                .onTapGesture {
                                    self.shown = true
                                    self.selectedArticle = post
                            }
                        }
                    }
                        //                List(service.articlePost) { post in
                        //                    NavigationLink(destination: AlertView(isShown: self.$shown, articlePost: self.$selectedArticle)) {
                        //                        ArticleListElementView(articlePost: post)
                        //                            .onTapGesture {
                        //                                self.shown.toggle()
                        //                                self.selectedArticle = post
                        //                        }
                        //                    }
                        //                }.onAppear {
                        //                    UITableView.appearance().separatorStyle = .none
                        //                }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                        .navigationBarTitle("Kose Yazilari",displayMode: .inline)
    
                        .navigationBarItems(trailing:
                            Button(action: {
                                print("button tapped")
                                self.isProfileViewPresented = true
                            }) {
                                Image("Right Icons 3")
                                    .renderingMode(.original)
                            }.sheet(isPresented: $isProfileViewPresented, content: { ProfileView()
                            }).foregroundColor(.black)
                    )
                }
                .onAppear {
                    self.service.fetchData()
                }
            }
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
            PopupArticleView(isShown: $shown, articlePost: selectedArticle)
        }
    }
    
    struct ArticleView_Previews: PreviewProvider {
        static var previews: some View {
            ArticleView()
        }
    }
}
