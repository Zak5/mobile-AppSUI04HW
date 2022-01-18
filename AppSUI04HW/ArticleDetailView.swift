//
//  ArticleDetailView.swift
//  
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI
import Networking
import Navigation

struct ArticleDetailView: View {
    var article: Article

    var body: some View {
        List {
            BackToNewsButtonView()
            Text("Id: \(article.id)")
            Text("Date: \(article.publishedAt ?? "")")
            Text("News site: \(article.newsSite ?? "")")
            Text("Source: \(article.url ?? "")")
        }
        .listStyle(.plain)
    }
}
