//
//  AirQuality.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct AirQuality: Codable {
    let co: Int?
    let no2: Double?
    let o3: Int?
    let so2: Double?
    let pm25: Double?
    let pm10: Double?
    let usEpaIndex: Int?
    let gbDefraIndex: Int?

    enum CodingKeys: String, CodingKey {
        case co
        case no2
        case o3
        case so2
        case pm25 = "pm2_5"
        case pm10
        case usEpaIndex = "us-epa-index"
        case gbDefraIndex = "gb-defra-index"
    }
}
