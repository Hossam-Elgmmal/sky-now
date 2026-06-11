//
//  HomeScreen.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var contentVisible = false
    
    @Environment(\.weatherTheme) private var theme

    var body: some View {
        NavigationView {
            ZStack {
                WeatherBackground()
                Group {
                    if viewModel.isFetching {
                        LoadingView()
                    } else if let weather = viewModel.weatherResponse {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 28) {
                                TopSection(weather: weather)

                                ForecastSection(forecast: weather.forecast)

                                BottomSection(current: weather.current)
                            }
                        }
                    } else if viewModel.currentLocation == nil {
                        PlaceholderView()
                    } else {
                        ContainerCard {
                            VStack(spacing: 16) {
                                Image(systemName: "wifi.slash")
                                    .font(.system(size: 28, weight: .light))
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: [
                                                theme.foregroundColor.opacity(0.60),
                                                theme.foregroundColor.opacity(0.40)
                                            ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                 
                                Button {
                                    viewModel.refresh()
                                } label: {
                                    Text("Refresh")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                }
                                .padding(.horizontal, 14)

                            }
                            .padding(.vertical, 16)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationBarHidden(true)
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
