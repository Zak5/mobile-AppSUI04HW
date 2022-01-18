//
//  ReportsListView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Networking
import Navigation

struct ReportsListView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    @State var selectedReport: Report?
    @State var selectedReportId: String = ""
    
    @Namespace private var ns
    
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                ForEach(newsViewModel.reports, id: \.id) { report in
                    ReportCellView(report: report)
                        .showActivityIdicator(newsViewModel.isListLoading && newsViewModel.reports.isLast(report))
                        .if(!(newsViewModel.isListLoading && newsViewModel.reports.isLast(report))) { view in
                            view.matchedGeometryEffect(id: String(report.id), in: ns, isSource: true)
                        }
                        .frame(maxHeight: 100)
                        .onTapGesture(count: 2) {
                            selectedReport = report
                            selectedReportId = String(report.id)
                        }
                        .onTapGesture(count: 1) {
                            routeModel.push(screenView: LazyView(ReportView(report: report)).toAnyView())
                        }
                        .onAppear {
                            if newsViewModel.reports.isLast(report) {
                                Task {
                                    await newsViewModel.getReports()
                                }
                            }
                        }
                }
            }
            .listStyle(.plain)
            
            if let report = selectedReport {
                HStack {
                    Spacer()
                    ReportCellView(report: report)
                        .matchedGeometryEffect(id: selectedReportId, in: ns, isSource: false)
                        .offset(x: 200, y: 100)
                        .frame(maxHeight: 100)
                        .scaleEffect(selectedReportId == "" ? 0.5 : 1)
                        .frame(width: selectedReportId == "" ? 300 : nil)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.0)) {
                                selectedReportId = ""
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
                                selectedReport = nil
                            }
                        }
                }
            }
        }
    }
}

struct ReportCellView: View {
    var report: Report

    var body: some View {
        Text(report.title ?? "")
    }
    
}
