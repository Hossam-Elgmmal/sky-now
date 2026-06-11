//
//  WeatherTheme.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI

enum WeatherTheme {
    case morning, evening

    static var current: WeatherTheme {
        let hour = Calendar.current.component(.hour, from: Date())
        return (5..<18).contains(hour) ? .morning : .evening
    }

    var foregroundColor: Color {
        switch self {
        case .morning: return .black
        case .evening: return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .morning: return .white
        case .evening: return .black
        }
    }

    var backgroundImage: String {
        switch self {
        case .morning: return "bg_morning"
        case .evening: return "bg_evening"
        }
    }

    var secondaryOpacity: Double {
        switch self {
        case .morning: return 0.6
        case .evening: return 0.7
        }
    }

    var scrimOpacity: Double {
        switch self {
        case .morning: return 0.15
        case .evening: return 0.35
        }
    }
}
