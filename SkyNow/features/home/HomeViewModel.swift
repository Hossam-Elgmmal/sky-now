//
//  MainViewModel.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import CoreLocation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - Published state
    @Published var weatherResponse: WeatherResponse?
    @Published var isFetching = false
    @Published var showSettingsAlert = false
    @Published var currentLocation: CLLocation?

    // MARK: - Dependencies
    private let weatherRepo: WeatherRepo
    private let locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()
    
    var settingsAlertMessage: String {
        if !CLLocationManager.locationServicesEnabled() {
            return "GPS is turned off. Go to Settings → Privacy & Security → Location Services and enable it."
        }
        return "Location access is denied for this app. Go to Settings → \(Bundle.main.appName) → Location and choose 'While Using'."
    }

    init(weatherRepo: WeatherRepo = WeatherRepoImp(),
         locationManager: LocationManager = LocationManager()) {
        self.weatherRepo = weatherRepo
        self.locationManager = locationManager
        bindLocation()
        bindSettingsAlert()
    }

    // MARK: - Public actions

    func openAppSettings() {
        locationManager.openAppSettings()
    }

    func retryLocation() {
        locationManager.retryLocation()
    }
    
    func refresh() {
        if let location = currentLocation {
            Task { [weak self] in
                await self?.fetchWeather(
                    lat: location.coordinate.latitude,
                    long: location.coordinate.longitude
                )
            }
        } else {
            retryLocation()
        }
    }

    // MARK: - Private bindings

    private func bindLocation() {
        locationManager.$location
            .compactMap { $0 }
            .removeDuplicates { $0.distance(from: $1) < 50 }
            .sink { [weak self] newLocation in
                guard let self = self else { return }
                self.currentLocation = newLocation
                Task { [weak self] in
                    await self?.fetchWeather(
                        lat: newLocation.coordinate.latitude,
                        long: newLocation.coordinate.longitude
                    )
                }
            }
            .store(in: &cancellables)
    }

    private func bindSettingsAlert() {
        locationManager.$showSettingsAlert
            .receive(on: DispatchQueue.main)
            .assign(to: &$showSettingsAlert)
    }

    // MARK: - Private fetch

    private func fetchWeather(lat: Double, long: Double) async {
        guard !isFetching else { return }
        isFetching = true
        weatherResponse = await weatherRepo.fetchCurrentWeather(
            lat: lat,
            long: long
        )
        isFetching = false
    }
    
    func fetchDefault() {
        Task { [weak self] in
            await self?.fetchWeather(lat: 30.0444, long: 31.2357)
        }
    }
}

extension Bundle {
    var appName: String {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        ?? object(forInfoDictionaryKey: "CFBundleName") as? String
        ?? "App"
    }
}
