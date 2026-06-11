//
//  BottomSection.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct BottomSection: View {
    let current: Current?

    var body: some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())],
            spacing: 12
        ) {
            StatCard(
                icon: "eye.fill",
                title: "VISIBILITY",
                value: current?.visKm.map { "\(Int($0)) km" } ?? "—",
                accentColor: Color("skyLightBlue")
            )
            StatCard(
                icon: "humidity.fill",
                title: "HUMIDITY",
                value: current?.humidity.map { "\($0)%" } ?? "—",
                accentColor: Color("skyGreen")
            )
            StatCard(
                icon: "thermometer",
                title: "FEELS LIKE",
                value: tempString(current?.feelslikeC),
                accentColor: Color("skyLightOrange")
            )
            StatCard(
                icon: "gauge",
                title: "PRESSURE",
                value: "\(Int(current?.pressureMb ?? 0)) hPa",
                accentColor: Color("skyPurple")
            )
        }
        .padding(.horizontal, 20)
    }
}

private struct StatCard: View {
    @Environment(\.weatherTheme) private var theme
    let icon: String
    let title: String
    let value: String
    let accentColor: Color

    var body: some View {
        ContainerCard {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(accentColor)

                Spacer()
                VStack(alignment: .center, spacing: 3) {
                    Text(title)
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .kerning(0.4)
                        .foregroundStyle(theme.foregroundColor.opacity(0.45))
                    Text(value)
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundStyle(theme.foregroundColor)
                        .minimumScaleFactor(0.7)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
        }
    }
}
