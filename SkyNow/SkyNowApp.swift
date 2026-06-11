//
//  SkyNowApp.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import SwiftUI

@main
struct SkyNowApp: App {
    @StateObject private var store = SavedCitiesStore()
    let theme = WeatherTheme.current

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance

        UITableView.appearance().backgroundColor = .clear
        UICollectionView.appearance().backgroundColor = .clear
        
        let fg = UIColor(theme.foregroundColor)
        let appearance2 = UITabBarAppearance()
        appearance2.configureWithTransparentBackground()
        appearance2.backgroundColor = theme == .morning
            ? UIColor.white
            : UIColor.black

        appearance2.stackedLayoutAppearance.selected.iconColor = fg
        appearance2.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: fg]

        let unselected = UIColor(theme.foregroundColor.opacity(0.6))
        appearance2.stackedLayoutAppearance.normal.iconColor = unselected
        appearance2.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselected]

        UITabBar.appearance().standardAppearance = appearance2
        UITabBar.appearance().scrollEdgeAppearance = appearance2
    }
    
    var body: some Scene {
        WindowGroup {
            MainNavigation()
                .environmentObject(store)
                .environment(\.weatherTheme, theme)
        }
    }
}
