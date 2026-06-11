//
//  CityRow.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI


struct CityRow: View {
    @Environment(\.weatherTheme) private var theme
    let city: City
    let isSaved: Bool
    let onToggle: () -> Void

    var body: some View {
        HStack {
            NavigationLink{
                CityDetailsScreen(city: city)
            } label: {
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(city.name)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundStyle(theme.foregroundColor)
                        Text(city.country)
                            .font(.system(size: 14, design: .rounded))
                            .foregroundStyle(theme.foregroundColor.opacity(0.80))
                    }
                    Spacer()
                }
                .contentShape(Rectangle())
            }

            Button(action: onToggle) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(isSaved ? Color("skyLightBlue") : theme.foregroundColor.opacity(0.75))
                    .frame(width: 44, height: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
}


