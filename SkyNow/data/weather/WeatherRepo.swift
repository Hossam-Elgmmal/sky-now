//
//  WeatherRepo.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation

protocol WeatherRepo {
    
    func fetchCurrentWeather(lat: Double, long: Double) async -> WeatherResponse?
    
}

class WeatherRepoImp : WeatherRepo {
    
    let weatherService: WeatherService
    
    init(weatherService: WeatherService = WeatherServiceImp()) {
        self.weatherService = weatherService
    }
    
    func fetchCurrentWeather(lat: Double, long: Double) async -> WeatherResponse? {
        let result = await weatherService.getWeatherData(lat: lat, long: long)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let weatherError):
            print(weatherError.localizedDescription)

            if let errorMessage = weatherError.errorDescription {
                await ErrorMessageController.shared.showAlert(message: errorMessage)
            }
            
            return nil
        }
    }
}
