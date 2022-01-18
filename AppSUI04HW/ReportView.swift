//
//  ReportView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct ReportView: View {
    var report: Report

    var body: some View {
        List {
            Text(report.title ?? "")
            Text(report.summary ?? "")
            ReadMoreButtonView(screenView: LazyView(ReportDetailView(report: report)).toAnyView())
        }
        .listStyle(.plain)
    }
}
