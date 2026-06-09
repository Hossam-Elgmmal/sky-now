//
//  Astro.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Astro: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moonPhase: String?
    let moonIllumination: Int?
    let isMoonUp: Int?
    let isSunUp: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}
