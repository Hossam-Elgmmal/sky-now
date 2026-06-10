//
//  Forecastday.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


struct Forecastday: Codable {
    let date: String?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case astro
        case hour
    }
}
