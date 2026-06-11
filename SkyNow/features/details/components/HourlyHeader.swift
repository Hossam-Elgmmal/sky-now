//
//  HourlyHeader.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import SwiftUI

struct HourlyHeader: View {
    @Environment(\.weatherTheme) private var theme
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        HStack {
            Button { dismiss() } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(theme.foregroundColor)
                    .frame(width: 48, height: 48)
                    .background(
                        Circle()
                            .fill(theme.backgroundColor.opacity(0.5))
                            .clipShape(Circle())
                    )
            }
            Spacer()
        }
    }
}
