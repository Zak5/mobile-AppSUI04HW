//
//  NewsView.swift
//  
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import UIComponents
import Networking
import Navigation

struct NewsView: View {
    
    @StateObject var newsViewModel = NewsViewModel()

    var body: some View {
        VStack {
            CustomPickerView<Category>(items: Category.allCases, selected: $newsViewModel.category) {
                Task {
                    await newsViewModel.getCategoryItems()
                }
            }
            if newsViewModel.category == .article {
                ArticlesListView(newsViewModel: newsViewModel)
            } else if newsViewModel.category == .blog {
                BlogsListView(newsViewModel: newsViewModel)
            } else if newsViewModel.category == .report {
                ReportsListView(newsViewModel: newsViewModel)
            }
        }
        .task {
            await newsViewModel.getCategoryItems()
        }
    }
}
