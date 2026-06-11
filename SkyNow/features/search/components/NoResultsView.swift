//
//  NoResultsView.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI

struct NoResultsView: View {
    @Environment(\.weatherTheme) private var theme
    let query: String
    var body: some View {
        ContainerCard {
            VStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 32, weight: .light))
                    .foregroundStyle(theme.foregroundColor)
                Text("No cities match \(query)")
                    .font(.system(size: 18, design: .rounded))
                    .foregroundStyle(theme.foregroundColor)
            }
            .padding()
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

