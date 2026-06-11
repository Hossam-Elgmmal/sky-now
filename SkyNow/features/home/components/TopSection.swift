//
//  TopSection.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct TopSection: View {
    @Environment(\.weatherTheme) private var theme
    let weather: WeatherResponse

    var body: some View {
        VStack(spacing: 6) {
            // Location pill
            HStack(spacing: 5) {
                Image(systemName: "location.fill")
                    .font(.system(size: 11))
                Text(weather.location?.name ?? "—")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .foregroundStyle(theme.foregroundColor.opacity(0.75))
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(theme.backgroundColor)
                    .background(Capsule().fill(.ultraThinMaterial))
                    .clipShape(Capsule())
            )
            // Temperature
            Text(tempString(weather.current?.tempC))
                .font(.system(size: 104, weight: .semibold, design: .rounded))
                .foregroundStyle(theme.foregroundColor)
                .shadow(color: .black.opacity(0.12), radius: 8, y: 4)

            // Condition icon + text
            VStack {
                if let icon = weather.current?.condition?.icon {
                    AsyncImage(url: URL(string: "https:\(icon)")) { img in
                        img.resizable()
                           .scaledToFill()
                           .padding(-40)
                           .frame(width: 80, height: 80)
                           .clipped()
                           .shadow(color: .black.opacity(0.15), radius: 6, y: 3)
                    } placeholder: {
                        Color.clear
                    }
                    .frame(width: 80, height: 80)
                }
                Text(weather.current?.condition?.text ?? "—")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundStyle(theme.foregroundColor.opacity(0.9))
            }

            if let day = weather.forecast?.forecastday?.first?.day {
                HStack(spacing: 0) {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 11, weight: .bold))
                        Text(tempString(day.mintempC))
                    }
                    .foregroundStyle(theme == .morning ? Color("skyBlue") : Color("skyLightBlue"))

                    Rectangle()
                        .fill(theme.foregroundColor.opacity(0.2))
                        .frame(width: 1, height: 14)
                        .padding(.horizontal, 14)

                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up")
                            .font(.system(size: 11, weight: .bold))
                        Text(tempString(day.maxtempC))
                    }
                    .foregroundStyle(theme == .morning ? Color("skyOrange") : Color("skyLightOrange"))
                }
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(theme.backgroundColor)
                        .background(Capsule().fill(.ultraThinMaterial))
                        .clipShape(Capsule())
                )
                .padding(.top, 4)
            }
        }
    }
}
