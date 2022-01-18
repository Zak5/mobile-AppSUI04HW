//
//  BlogDetailView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct BlogDetailView: View {
    var blog: Blog

    var body: some View {
        List {
            BackToNewsButtonView()
            Text("Id: \(blog.id)")
            Text("Date: \(blog.publishedAt ?? "")")
            Text("News site: \(blog.newsSite ?? "")")
            Text("Source: \(blog.url ?? "")")
        }
        .listStyle(.plain)
    }
}
