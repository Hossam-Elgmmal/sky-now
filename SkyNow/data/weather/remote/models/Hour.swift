//
//  Hour.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Hour: Codable {
    let time: String?
    let tempC: Double?
    let isDay: Int?
    let condition: Condition?
    let windKph: Double?
    let humidity: Int?
    let chanceOfRain: Int?
    let chanceOfSnow: Int?
    let feelslikeC: Double?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windKph = "wind_kph"
        case humidity
        case chanceOfRain = "chance_of_rain"
        case chanceOfSnow = "chance_of_snow"
        case feelslikeC = "feelslike_c"
        case uv
    }
}
