//
//  ForecastSection.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct ForecastSection: View {
    @Environment(\.weatherTheme) private var theme
    let forecast: Forecast?

    var body: some View {
        ContainerCard {
            VStack(alignment: .leading, spacing: 0) {
                // Section header
                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .font(.system(size: 16, weight: .bold))
                    Text("3-DAY FORECAST")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .kerning(0.5)
                }
                .foregroundStyle(theme.foregroundColor.opacity(0.65))
                .padding(.bottom, 16)
                .padding(.horizontal, 20)

                let days = forecast?.forecastday ?? []
                ForEach(Array(days.enumerated()), id: \.offset) { index, day in
                    NavigationLink {
                        HourlyDetails(day: day)
                    } label: {
                        ForecastRow(day: day, index: index)
                    }
                    .padding(.horizontal, 20)

                    if index < days.count - 1 {
                        Divider()
                            .background(theme.foregroundColor.opacity(0.3))
                            .padding(.vertical, 12)
                    }
                }
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 20)
    }
}

private struct ForecastRow: View {
    @Environment(\.weatherTheme) private var theme
    let day: Forecastday
    let index: Int
    @State private var pressed = false

    private var label: String {
        switch index {
        case 0: return "Today"
        default: return dayName(from: day.date)
        }
    }

    private var isToday: Bool { index == 0 }

    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 16, weight: isToday ? .semibold : .medium, design: .rounded))
                .foregroundStyle(
                    theme.foregroundColor
                )
                .padding(.horizontal, 8)

            Spacer()

            HStack(spacing: 5) {
                Text(tempString(day.day?.mintempC))
                    .foregroundStyle(theme == .morning ? Color("skyBlue") : Color("skyLightBlue"))
                Text("–")
                    .foregroundStyle(theme.foregroundColor.opacity(0.6))
                Text(tempString(day.day?.maxtempC))
                    .foregroundStyle(theme == .morning ? Color("skyOrange") : Color("skyLightOrange"))
            }
            .font(.system(size: 14, weight: .semibold, design: .rounded))

            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(theme.foregroundColor.opacity(0.45))
                .padding(.leading, 8)
        }
        .contentShape(Rectangle())        
    }
}
