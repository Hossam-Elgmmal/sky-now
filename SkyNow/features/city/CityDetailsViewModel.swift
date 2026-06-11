//
//  CityDestination.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//
import Foundation

@MainActor
final class CityDetailsViewModel: ObservableObject {

    @Published private(set) var forecastday: Forecastday?
    @Published private(set) var isLoading = false
    @Published private(set) var hasFailed = false

    private let weatherRepo: WeatherRepo
    private let city: City

    init(city: City, weatherRepo: WeatherRepo = WeatherRepoImp()) {
        self.city = city
        self.weatherRepo = weatherRepo
        Task {
            await loadData()
        }
    }

    private func loadData() async {
        guard !isLoading else { return }
        isLoading = true
        hasFailed = false
        let response = await weatherRepo.fetchCurrentWeather(lat: city.lat, long: city.lon)
        forecastday = response?.forecast?.forecastday?.first
        hasFailed = forecastday == nil
        isLoading = false
    }

    func refresh() async {
        forecastday = nil
        Task {
            await loadData()
        }
    }
}
