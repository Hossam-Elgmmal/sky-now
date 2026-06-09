//
//  Config.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation

enum Config {
    static var weatherAPIKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") as? String,
              !key.isEmpty else {
            fatalError("WEATHER_API_KEY missing from Info.plist")
        }
        return key
    }
}
