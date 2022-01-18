//
//  ArticleView.swift
//  
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI
import Networking
import Navigation

struct ArticleView: View {    
    var article: Article

    var body: some View {
        List {
            Text(article.title ?? "")
            Text(article.summary ?? "")
            ReadMoreButtonView(screenView: LazyView(ArticleDetailView(article: article)).toAnyView())
        }
        .listStyle(.plain)
    }
}
