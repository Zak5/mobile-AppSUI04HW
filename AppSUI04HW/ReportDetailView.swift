//
//  ReportDetailView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct ReportDetailView: View {
    var report: Report

    var body: some View {
        List {
            BackToNewsButtonView()
            Text("Id: \(report.id)")
            Text("Date: \(report.publishedAt ?? "")")
            Text("News site: \(report.newsSite ?? "")")
            Text("Source: \(report.url ?? "")")
        }
        .listStyle(.plain)
    }
}
