//
//  Day.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Day: Codable {
    let maxtempC: Double?
    let maxtempF: Double?
    let mintempC: Double?
    let mintempF: Double?
    let avgtempC: Double?
    let avgtempF: Double?
    let maxwindMph: Double?
    let maxwindKph: Double?
    let totalprecipMm: Int?
    let totalprecipIn: Int?
    let totalsnowCm: Int?
    let avgvisKm: Int?
    let avgvisMiles: Int?
    let avghumidity: Int?
    let dailyWillItRain: Int?
    let dailyChanceOfRain: Int?
    let dailyWillItSnow: Int?
    let dailyChanceOfSnow: Int?
    let condition: Condition?
    let uv: Double?
    let airQuality: AirQuality?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCm = "totalsnow_cm"
        case avgvisKm = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv
        case airQuality = "air_quality"
    }
}
