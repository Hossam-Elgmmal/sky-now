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
    let moonPhase: String?
    let moonIllumination: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}
