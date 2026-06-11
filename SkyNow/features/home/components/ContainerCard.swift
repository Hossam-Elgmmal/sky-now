//
//  FrostCard.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct ContainerCard<Content: View>: View {
    @Environment(\.weatherTheme) private var theme
    @ViewBuilder let content: Content

    var body: some View {
        content
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        theme.backgroundColor
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
    }
}
