//
//  SavedScreen.swift
//  SkyNow
//
//  Created by Hossam on 10/06/2026.
//

import SwiftUI


struct SavedLocationsScreen: View {
    @Environment(\.weatherTheme) private var theme
    @EnvironmentObject private var store: SavedCitiesStore
    
    @State var indexToDelete: Int?
    @State var showDeleteAlert: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                WeatherBackground()
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            HStack {
                                Text("Saved Locations")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundStyle(theme.foregroundColor)
                                Image(systemName: "bookmark.fill")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(Color("skyLightBlue"))
                            }
                            Text("\(store.saved.count) \(store.saved.count == 1 ? "city" : "cities")")
                                .font(.system(size: 14, design: .rounded))
                                .foregroundStyle(theme.foregroundColor.opacity(0.8))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 20)
                    .padding(.bottom, 16)

                    if store.saved.isEmpty {
                        SavedEmptyView()
                    } else {
                        List {
                            ForEach(Array(store.saved.enumerated()), id: \.element.objectID) { index, saved in
                                NavigationLink {
                                    CityDetailsScreen(city: saved.city)
                                } label: {
                                    SavedCityRow(savedCity: saved)
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40))
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(theme.backgroundColor)
                                )
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        indexToDelete = index
                                        showDeleteAlert = true
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                            }
                        }
                        .listStyle(.plain)
                        .onAppear { UIScrollView.appearance().showsVerticalScrollIndicator = false }
                        .alert("Delete City", isPresented: $showDeleteAlert) {
                            Button("Delete", role: .destructive) {
                                guard let index = indexToDelete else {
                                    return
                                }
                                withAnimation {
                                    store.delete(at: IndexSet(integer: index))
                                }
                            }

                            Button("Cancel", role: .cancel) { indexToDelete = nil }
                        } message: {
                            Text("Are you sure you want to delete this city?")
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
