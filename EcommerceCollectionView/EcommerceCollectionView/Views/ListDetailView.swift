//
//  ListDetailView.swift
//  EcommerceCollectionView
//
//  Created by Mert Köksal on 25.08.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import SwiftUI

struct ListDetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: self.url)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(url: "https://www.google.com")
    }
}
