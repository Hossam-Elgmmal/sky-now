//
//  Location.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation



struct Location: Codable {
    let name: String?
    let country: String?
    let tzId: String?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case tzId = "tz_id"
        case localtime
    }
}
