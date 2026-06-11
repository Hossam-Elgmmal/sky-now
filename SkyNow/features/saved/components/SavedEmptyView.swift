//
//  SavedEmptyView.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI


struct SavedEmptyView: View {
    @Environment(\.weatherTheme) private var theme
    var body: some View {
        ContainerCard {
            VStack(spacing: 12) {
                ZStack {
                    Circle()
                        .strokeBorder(
                            style: StrokeStyle(lineWidth: 1, dash: [4, 6])
                        )
                        .foregroundStyle(theme.foregroundColor.opacity(0.38))
                        .frame(width: 90, height: 90)

                    Circle()
                        .fill(theme.foregroundColor.opacity(0.20))
                        .frame(width: 66, height: 66)

                    Image(systemName: "bookmark.slash")
                        .font(.system(size: 28, weight: .light))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    theme.foregroundColor.opacity(0.85),
                                    theme.foregroundColor.opacity(0.55)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }

                VStack(spacing: 8) {
                    Text("No saved cities yet")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(theme.foregroundColor)

                    Text("Use the search tab to find cities\nand bookmark them here.")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundStyle(theme.foregroundColor.opacity(0.85))
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                }
            }
            .padding(20)
        }
        .frame(maxHeight: .infinity)
        
    }
}



