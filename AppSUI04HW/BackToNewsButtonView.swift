//
//  BackToNewsButtonView.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 16.01.2022.
//

import SwiftUI
import Navigation

struct BackToNewsButtonView: View {
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        Button("Back to news") {
            routeModel.popToRoot()
        }
        .buttonStyle(ActionButtonStyle())
    }
}
