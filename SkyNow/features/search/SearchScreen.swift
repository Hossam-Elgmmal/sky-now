//
//  SearchScreen.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//
import SwiftUI

struct SearchScreen: View {
    @Environment(\.weatherTheme) private var theme
    @StateObject private var viewModel = SearchViewModel()
    @EnvironmentObject private var store: SavedCitiesStore

    var body: some View {
        NavigationView {
            ZStack {
                WeatherBackground()

                VStack {
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(theme.foregroundColor.opacity(0.95))

                        TextField(
                            "Search cities…",
                            text: $viewModel.query
                        )
                        .disableAutocorrection(true)
                        .submitLabel(.search)
                        .font(.system(size: 17, design: .rounded))
                        .foregroundStyle(theme.foregroundColor)

                        if !viewModel.query.isEmpty {
                            Button {
                                viewModel.query = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundStyle(theme.foregroundColor.opacity(0.40))
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(theme.backgroundColor)
                            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .animation(.spring(response: 0.25), value: viewModel.query.isEmpty)

                    if viewModel.query.trimmingCharacters(in: .whitespaces).isEmpty {
                        EmptySearchQuery()
                    } else if viewModel.results.isEmpty {
                        NoResultsView(query: viewModel.query)
                    } else {
                        ScrollView(showsIndicators: false) {
                            LazyVStack {
                                ForEach(Array(viewModel.results.enumerated()), id: \.element.id) { index, city in
                                    CityRow(
                                        city: city,
                                        isSaved: store.isSaved(city),
                                        onToggle: { store.toggle(city) }
                                    )
                                    if index < viewModel.results.count - 1 {
                                        Divider()
                                            .background(theme.foregroundColor.opacity(0.08))
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 24, style: .continuous)
                                    .fill(theme.backgroundColor)
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 32)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


