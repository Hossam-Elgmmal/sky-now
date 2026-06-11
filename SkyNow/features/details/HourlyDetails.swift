//
//  DetailsScreen.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct HourlyDetails: View {
    @Environment(\.weatherTheme) private var theme
    @Environment(\.dismiss) private var dismiss
    let day: Forecastday
    
    private var dayTitle: String {
        guard let str = day.date else { return "Forecast" }
        let f = DateFormatter(); f.dateFormat = "yyyy-MM-dd"
        guard let date = f.date(from: str) else { return "Forecast" }
        if Calendar.current.isDateInToday(date)    { return "Today" }
        let out = DateFormatter(); out.dateFormat = "EEEE, MMM d"
        return out.string(from: date)
    }
    
    var body: some View {
        ZStack {
            WeatherBackground()

            VStack(spacing: 16) {
                HourlyHeader()
                    .padding(.horizontal, 40)
                
                VStack(spacing: 3) {
                    Text(dayTitle)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(theme.foregroundColor)
                }
                
                HStack(spacing: 8) {
                    if let condition = day.day?.condition?.text {
                        Text(condition)
                            .font(.system(size: 20, design: .rounded))
                            .foregroundStyle(theme.foregroundColor.opacity(0.8))
                    }
                    if let minT = day.day?.mintempC, let maxT = day.day?.maxtempC {
                        HStack(spacing: 3) {
                            Text(tempString(minT))
                                .foregroundStyle(theme == .morning ? Color("skyBlue") : Color("skyLightBlue"))
                            Text("|")
                                .foregroundStyle(theme.foregroundColor.opacity(0.7))
                            Text(tempString(maxT))
                                .foregroundStyle(theme == .morning ? Color("skyOrange") : Color("skyLightOrange"))
                        }
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                    }
                }
                .padding(.horizontal, 14)
                .background(
                    Capsule()
                        .fill(theme.backgroundColor)
                        .background(Capsule().fill(.ultraThinMaterial))
                        .clipShape(Capsule())
                )
                if let hours = day.hour {
                    HourList(hours: hours)
                }
            }
        }
        .navigationBarHidden(true)
    }
}


// MARK: - DateFormatter helper
extension DateFormatter {
    func then(_ block: (DateFormatter) -> Void) -> DateFormatter {
        block(self); return self
    }
}
