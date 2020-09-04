//
//  ContentView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 24.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            ZStack {
                TabView {
                    ArticleView()
                        .tabItem({
                            Image(systemName: "pencil.tip")
                            Text("Kose Yazilari")
                        })
                    AuthorView()
                        .tabItem({
                            Image(systemName: "person.crop.rectangle")
                            Text("Yazarlar")
                        })
                }
                .accentColor(Color.primary)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
