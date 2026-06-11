//
//  ContentView.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import SwiftUI
import CoreData

struct MainNavigation: View {
    @State private var selectedTab = 0
    @StateObject private var manager = ErrorMessageController.shared
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            SearchScreen()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)

            SavedScreen()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }
                .tag(2)
            
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: { manager.currentMessage != nil },
                set: { if !$0 { manager.dismiss() } }
            ),
            actions: {
                Button("OK") {
                    manager.dismiss()
                }
            },
            message: {
                Text(manager.currentMessage?.message ?? "")
            }
        )
    }

}
