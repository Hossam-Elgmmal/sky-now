//
//  WeatherThemeKey.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI

private struct WeatherThemeKey: EnvironmentKey {
    static let defaultValue: WeatherTheme = .current
}

extension EnvironmentValues {
    var weatherTheme: WeatherTheme {
        get { self[WeatherThemeKey.self] }
        set { self[WeatherThemeKey.self] = newValue }
    }
}
