//
//  HourList.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI

struct HourList: View {
    
    @Environment(\.weatherTheme) private var theme
    let hours: [Hour]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(Array(hours.enumerated()), id: \.offset) { index, hour in
                    HourRow(
                        hour: hour,
                        rowIndex: index
                    )

                    if index < hours.count - 1 {
                        Divider()
                            .background(theme.foregroundColor.opacity(0.08))
                            .padding(.horizontal, 20)
                    }
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(theme.backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 48)
        }
    }
}

