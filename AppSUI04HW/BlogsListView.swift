//
//  BlogsListView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct BlogsListView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    @State var selectedBlog: Blog?
    @State var selectedBlogId: String = ""
    
    @Namespace private var ns
    
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                ForEach(newsViewModel.blogs, id: \.id) { blog in
                    BlogCellView(blog: blog)
                        .showActivityIdicator(newsViewModel.isListLoading && newsViewModel.blogs.isLast(blog))
                        .if(!(newsViewModel.isListLoading && newsViewModel.blogs.isLast(blog))) { view in
                            view.matchedGeometryEffect(id: String(blog.id), in: ns, isSource: true)
                        }
                        .frame(maxHeight: 100)
                        .onTapGesture(count: 2) {
                            selectedBlog = blog
                            selectedBlogId = String(blog.id)
                        }
                        .onTapGesture(count: 1) {
                            routeModel.push(screenView: LazyView(BlogView(blog: blog)).toAnyView())
                        }
                        .onAppear {
                            if newsViewModel.blogs.isLast(blog) {
                                Task {
                                    await newsViewModel.getBlogs()
                                }
                            }
                        }
                }
            }
            .listStyle(.plain)
            
            if let blog = selectedBlog {
                HStack {
                    Spacer()
                    BlogCellView(blog: blog)
                        .matchedGeometryEffect(id: selectedBlogId, in: ns, isSource: false)
                        .offset(x: 200, y: 100)
                        .frame(maxHeight: 100)
                        .scaleEffect(selectedBlogId == "" ? 0.5 : 1)
                        .frame(width: selectedBlogId == "" ? 300 : nil)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.0)) {
                                selectedBlogId = ""
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
                                selectedBlog = nil
                            }
                        }
                }
            }
        }
    }
}

struct BlogCellView: View {
    var blog: Blog

    var body: some View {
        Text(blog.title ?? "")
    }
    
}
