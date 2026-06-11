//
//  WeatherBackground.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct WeatherBackground: View {
    @Environment(\.weatherTheme) private var theme

    var body: some View {
        Image(theme.backgroundImage)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}
