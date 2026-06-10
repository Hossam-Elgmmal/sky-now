//
//  Current.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Current: Codable {
    let lastUpdated: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windKph: Double?
    let windDir: String?
    let humidity: Int?
    let cloud: Int?
    let feelslikeC: Double?
    let feelslikeF: Double?
    let visKm: Double?
    let uv: Double?
    let gustKph: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windKph = "wind_kph"
        case windDir = "wind_dir"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKm = "vis_km"
        case uv
        case gustKph = "gust_kph"
    }
}
