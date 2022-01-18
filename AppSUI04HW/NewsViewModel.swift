//
//  NewsViewModel.swift
//  
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import Networking
import UIComponents
import ServiceLocator

enum Category: CaseIterable, CustomPickerItemProtocol {
    case article
    case blog
    case report

    var label: String {
        get {
            switch self {
            case .article:
                return "Articles"
            case .blog:
                return "Blogs"
            case .report:
                return "Reports"
            }
        }
    }
}

@MainActor
final class NewsViewModel : ObservableObject {
    
    @Injected var articleService: ArticleService?
    @Injected var blogService: BlogService?
    @Injected var reportService: ReportService?
    
    @Published var category: Category = .article
    @Published var articles = [Article]()
    @Published var blogs = [Blog]()
    @Published var reports = [Report]()
    @Published var isListLoading: Bool = false
    
    private var totalResults: Int = 0
    private let limit: Int = 100
    
    func getCategoryItems() async {
        
        totalResults = 0
        
        switch category {
        case .article:
            await getArticles()
        case .blog:
            await getBlogs()
        case .report:
            await getReports()
        }
    }
    
    func getArticles() async {
        
        guard isListLoading == false else {
            return
        }
        
        isListLoading = true

        articleService?.articlesGet(limit: limit, start: totalResults) { list, error in
            self.totalResults += list?.count ?? 0
            self.articles.append(contentsOf: list ?? [])
            self.isListLoading = false
        }
    }
    
    func getBlogs() async {
        guard isListLoading == false else {
            return
        }
        
        isListLoading = true

        blogService?.blogsGet(limit: limit, start: totalResults) { list, error in
            self.totalResults += list?.count ?? 0
            self.blogs.append(contentsOf: list ?? [])
            self.isListLoading = false
        }
    }
    
    func getReports() async {
        guard isListLoading == false else {
            return
        }
        
        isListLoading = true

        reportService?.reportsGet(limit: limit, start: totalResults) { list, error in
            self.totalResults += list?.count ?? 0
            self.reports.append(contentsOf: list ?? [])
            self.isListLoading = false
        }
    }

}
