//
//  WeatherResponse.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation



struct WeatherResponse: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}
