//
//  WeatherService.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation

protocol WeatherService {
    func getWeatherData(lat: Double, long: Double) async -> Result<WeatherResponse, WeatherError>
}

class WeatherServiceImp: WeatherService {
    
    let client: NetworkClient
    
    init(client: NetworkClient = NetworkClientImp()) {
        self.client = client
    }

    func getWeatherData(lat: Double, long: Double) async -> Result<WeatherResponse, WeatherError> {
        
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(Config.weatherAPIKey)&q=\(lat),\(long)&days=3&aqi=yes&alerts=no"
        
        return await client.fetch(WeatherResponse.self, from: urlString)
        
    }
    
}
