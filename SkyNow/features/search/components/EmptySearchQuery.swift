//
//  EmptySearchPrompt.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI


struct EmptySearchQuery: View {
    @Environment(\.weatherTheme) private var theme
    var body: some View {
        ContainerCard {
            VStack(spacing: 10) {
                Image(systemName: "globe")
                    .font(.system(size: 36, weight: .light))
                    .foregroundStyle(theme.foregroundColor)
                Text("Search for cities worldwide")
                    .font(.system(size: 18, design: .rounded))
                    .foregroundStyle(theme.foregroundColor)
                Text("Search by city or country")
                    .font(.system(size: 14, design: .rounded))
                    .foregroundStyle(theme.foregroundColor.opacity(0.8))
            }
            .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

