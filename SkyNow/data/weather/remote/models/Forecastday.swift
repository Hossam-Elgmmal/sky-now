//
//  Forecastday.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation



struct Forecastday: Codable {
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Hour?]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
        case astro
        case hour
    }
}
