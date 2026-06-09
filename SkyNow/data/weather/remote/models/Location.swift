//
//  Location.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation



struct Location: Codable {
    let name: String?
    let region: String?
    let country: String?
    let lat: Double?
    let lon: Double?
    let tzId: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
