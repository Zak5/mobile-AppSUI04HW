//
//  Configurator.swift
//
//
//  Created by Konstantin Zaharev on 28.12.2021.
//

import Foundation
import ServiceLocator
import Networking

class ArticleService {
    
    func articlesGet(limit: Int? = nil, start: Int? = nil, completion: @escaping ((_ data: [Article]?, _ error: Error?) -> Void)) {
        
        ArticleAPI.articlesGet(limit: limit, start: start, completion: completion)
    }
}

class BlogService {
    
    func blogsGet(limit: Int? = nil, start: Int? = nil, completion: @escaping ((_ data: [Blog]?, _ error: Error?) -> Void)) {
        
        BlogAPI.blogsGet(limit: limit, start: start, completion: completion)
    }
}

class ReportService {
    
    func reportsGet(limit: Int? = nil, start: Int? = nil, completion: @escaping ((_ data: [Report]?, _ error: Error?) -> Void)) {
        
        ReportAPI.reportsGet(limit: limit, start: start, completion: completion)
    }
}

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addService(ArticleService())
        ServiceLocator.shared.addService(BlogService())
        ServiceLocator.shared.addService(ReportService())
    }
}
