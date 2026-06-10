//
//  LocationService.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import CoreLocation
import Combine
import UIKit

class LocationManager: NSObject, ObservableObject {

    // MARK: - Published state
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var location: CLLocation?
    @Published var showSettingsAlert: Bool = false

    // MARK: - Private
    private let manager = CLLocationManager()

    override init() {
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        startOrRequestLocation()
    }

    // MARK: - Public

    /// Call this to retry after the user returns from Settings.
    func retryLocation() {
        startOrRequestLocation()
    }

    /// Opens the iOS Settings app directly to this app's location page.
    func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }

    // MARK: - Private helpers

    private func startOrRequestLocation() {
        switch authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            if CLLocationManager.locationServicesEnabled() {
                manager.startUpdatingLocation()
            } else {
                showSettingsAlert = true
            }
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            showSettingsAlert = true
        @unknown default:
            manager.requestWhenInUseAuthorization()
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        startOrRequestLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        location = newLocation
        manager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        let clError = error as? CLError
        switch clError?.code {
        case .denied:
            showSettingsAlert = true
        case .locationUnknown:
            break
        default:
            Task {
                await ErrorMessageController
                    .shared
                    .showAlert(message: error.localizedDescription)
            }
        }
    }
}
