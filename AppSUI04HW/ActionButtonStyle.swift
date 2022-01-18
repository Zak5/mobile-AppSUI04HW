//
//  ActionButtonStyle.swift
//  AppSUI04HW
//
//  Created by Konstantin Zaharev on 18.01.2022.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
    }
}
