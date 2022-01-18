//
//  BlogView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct BlogView: View {
    var blog: Blog

    var body: some View {
        List {
            Text(blog.title ?? "")
            Text(blog.summary ?? "")
            ReadMoreButtonView(screenView: LazyView(BlogDetailView(blog: blog)).toAnyView())
        }
        .listStyle(.plain)
    }
}
