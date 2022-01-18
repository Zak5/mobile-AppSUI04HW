//
//  AticlesListView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct ArticlesListView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    @State var selectedArticle: Article?
    @State var selectedArticleId: String = ""
    
    @Namespace private var ns
 
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                ForEach(newsViewModel.articles, id: \.id) { article in
                    ArticleCellView(article: article)
                        .showActivityIdicator(newsViewModel.isListLoading && newsViewModel.articles.isLast(article))
                        .if(!(newsViewModel.isListLoading && newsViewModel.articles.isLast(article))) { view in
                            view.matchedGeometryEffect(id: String(article.id), in: ns, isSource: true)
                        }
                        .frame(maxHeight: 100)
                        .onTapGesture(count: 2) {
                            selectedArticle = article
                            selectedArticleId = String(article.id)
                        }
                        .onTapGesture(count: 1) {
                            routeModel.push(screenView: LazyView(ArticleView(article: article)).toAnyView())
                        }
                        .task {
                            if newsViewModel.articles.isLast(article) {
                                await newsViewModel.getArticles()
                            }
                        }
                }
            }
            .listStyle(.plain)

            if let article = selectedArticle {
                HStack {
                    Spacer()
                    ArticleCellView(article: article)
                        .matchedGeometryEffect(id: selectedArticleId, in: ns, isSource: false)
                        .offset(x: 200, y: 100)
                        .frame(maxHeight: 100)
                        .scaleEffect(selectedArticleId == "" ? 0.5 : 1)
                        .frame(width: selectedArticleId == "" ? 300 : nil)
                        .onAppear {
                            withAnimation(.easeInOut) {
                                selectedArticleId = ""
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
                                selectedArticle = nil
                            }
                        }
                }
            }
        }
    }
}

struct ArticleCellView: View {
    
    var article: Article

    var body: some View {
        Text(article.title ?? "")
    }
    
}
