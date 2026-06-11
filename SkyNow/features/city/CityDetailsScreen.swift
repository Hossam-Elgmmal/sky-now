//
//  CityDetailsScreen.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//
import SwiftUI

struct CityDetailsScreen: View {
    @Environment(\.weatherTheme) private var theme
    @StateObject private var viewModel: CityDetailsViewModel

    init(city: City) {
        _viewModel = StateObject(wrappedValue: CityDetailsViewModel(city: city))
    }

    var body: some View {
        ZStack {
            WeatherBackground()

            Group {
                if viewModel.isLoading {
                    LoadingView()
                        .padding(.horizontal, 10)
                } else if let day = viewModel.forecastday {
                    HourlyDetails(day: day)
                } else if viewModel.hasFailed {
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
                                Task { await viewModel.refresh() }
                            } label: {
                                Text("Refresh")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                            }
                            .padding(.horizontal, 14)
                        }
                        .padding(.vertical, 16)
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
