//
//  Hour.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Hour: Codable {
    let timeEpoch: Int?
    let time: String?
    let tempC: Int?
    let tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMph: Double?
    let windKph: Double?
    let windDegree: Int?
    let windDir: String?
    let pressureMb: Int?
    let pressureIn: Double?
    let precipMm: Int?
    let precipIn: Int?
    let snowCm: Int?
    let humidity: Int?
    let cloud: Int?
    let feelslikeC: Double?
    let feelslikeF: Double?
    let windchillC: Int?
    let windchillF: Double?
    let heatindexC: Double?
    let heatindexF: Double?
    let dewpointC: Double?
    let dewpointF: Double?
    let willItRain: Int?
    let chanceOfRain: Int?
    let willItSnow: Int?
    let chanceOfSnow: Int?
    let visKm: Int?
    let visMiles: Int?
    let gustMph: Int?
    let gustKph: Double?
    let uv: Int?
    let airQuality: AirQuality?
    let shortRad: Int?
    let diffRad: Int?
    let dni: Int?
    let gti: Int?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCm = "snow_cm"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
        case airQuality = "air_quality"
        case shortRad = "short_rad"
        case diffRad = "diff_rad"
        case dni
        case gti
    }
}
