//
//  SavedCityRow.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI


struct SavedCityRow: View {
    @Environment(\.weatherTheme) private var theme
    let savedCity: SavedCity

    private var city: City { savedCity.city }

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(Color("skyLightBlue").opacity(0.80))
                .frame(width: 8, height: 8)

            VStack(alignment: .leading, spacing: 3) {
                Text(city.name)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundStyle(theme.foregroundColor)
                Text(city.country)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundStyle(theme.foregroundColor.opacity(0.80))
            }
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.trailing, 12)
        .padding(.vertical, 16)
        
    }
}

