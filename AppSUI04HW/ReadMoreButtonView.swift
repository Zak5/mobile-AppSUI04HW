//
//  ReadMoreButtonView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Navigation

struct ReadMoreButtonView: View {
    var screenView: AnyView
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        Button("Read more") {
            routeModel.push(screenView: screenView)
        }
        .buttonStyle(ActionButtonStyle())
    }
}
