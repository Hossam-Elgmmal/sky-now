//
//  Day.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Day: Codable {
    let maxtempC: Double?
    let mintempC: Double?
    let avgtempC: Double?
    let maxwindKph: Double?
    let totalprecipMm: Double?
    let avghumidity: Int?
    let dailyChanceOfRain: Int?
    let dailyChanceOfSnow: Int?
    let condition: Condition?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case avgtempC = "avgtemp_c"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case avghumidity
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv
    }
}
