//
//  HomeScreen.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct HomeScreen: View {
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView{
            VStack {
                if let response = viewModel.weatherResponse {
                    Text(response.location?.country ?? "")
                    Text(response.current?.condition?.text ?? "")
                }
            }
        }
        .alert("Location Required", isPresented: $viewModel.showSettingsAlert) {
            Button("Open Settings") { viewModel.openAppSettings() }
            Button("Cancel", role: .cancel) { viewModel.fetchDefault() }
        } message: {
            Text(viewModel.settingsAlertMessage)
        }
        .onReceive(
            NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
        ) { _ in
            viewModel.retryLocation()
        }
    }
}
