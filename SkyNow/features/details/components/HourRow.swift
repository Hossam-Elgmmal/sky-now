//
//  HourRow.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI


struct HourRow: View {
    @Environment(\.weatherTheme) private var theme
    let hour: Hour
    let rowIndex: Int

    private var timeLabel: String {
        guard let t = hour.time?.split(separator: " ").last.map(String.init) else { return "—" }
        let f = DateFormatter(); f.dateFormat = "HH:mm"
        guard let date = f.date(from: t) else { return t }
        let out = DateFormatter(); out.dateFormat = "h a"
        return out.string(from: date)
    }

    var body: some View {
        HStack {
            if let icon = hour.condition?.icon {
                AsyncImage(url: URL(string: "https:\(icon)")) { img in
                    img.resizable()
                        .scaledToFill()
                        .padding(-12)
                        .clipped()
                } placeholder: { Color.clear }
                .frame(width: 32, height: 32)
                .padding(.horizontal, 12)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(timeLabel)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundStyle(
                        theme.foregroundColor
                    )
            }
            Spacer()
            if let text = hour.condition?.text {
                Text(text)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundStyle(theme.foregroundColor.opacity(0.8))
                    .padding(.horizontal, 12)
            }
            Text(tempString(hour.tempC))
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundStyle(theme.foregroundColor)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
}
