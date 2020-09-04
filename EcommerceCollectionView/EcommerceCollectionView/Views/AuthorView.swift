//
//  AuthorView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 28.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct AuthorView: View {
   @ObservedObject var service = AuthorService()
    @State private var selectedTab = 0
    @State var shown: Bool = false
    @State var isProfileViewPresented = false
    @State var selectedAuthor = AuthorPost(author_id: 0, author_image: "", author_name: "", author_url: "", read_count: "")
    var body: some View {
        
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationView {
                List(service.authorPost) { post in
                    NavigationLink(destination: ListDetailView(url: post.author_url)) {
                        AuthorListElementView(authorPost: post)
                    }
                }.onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .padding(.vertical)
                .navigationBarTitle("Yazarlar",displayMode: .inline)
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
//            PopupAuthorView()
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
