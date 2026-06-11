//
//  PlaceholderView.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct PlaceholderView: View {
    @Environment(\.weatherTheme) private var theme
 
    var body: some View {
        ContainerCard {
            VStack(spacing: 16) {
                 ZStack {
                    Circle()
                        .strokeBorder(
                            style: StrokeStyle(lineWidth: 1, dash: [4, 6])
                        )
                        .foregroundStyle(theme.foregroundColor.opacity(0.34))
                        .frame(width: 86, height: 86)
 
                    Circle()
                        .fill(theme.foregroundColor.opacity(0.15))
                        .frame(width: 64, height: 64)
 
                    Image(systemName: "location.slash.fill")
                        .font(.system(size: 28, weight: .light))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    theme.foregroundColor.opacity(0.60),
                                    theme.foregroundColor.opacity(0.40)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
 
                VStack(spacing: 6) {
                    Text("Waiting For Location")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(theme.foregroundColor.opacity(0.90))
 
                    Text("Allow location access in Settings\nto see your local forecast.")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundStyle(theme.foregroundColor.opacity(0.68))
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                }
                .padding(.horizontal, 14)

            }
            .padding(.vertical, 16)
        }
    }
}
