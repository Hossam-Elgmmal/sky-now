//
//  MainViewModel.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


class MainViewModel: ObservableObject {
    
    @Published var weatherResponse: WeatherResponse?
    
    let repo: WeatherRepo
    
    init(repo: WeatherRepo = WeatherRepoImp()) {
        self.repo = repo
    }
    
    func fetchData() {
        
    }
    
    func getCurrentLocation() {
        
    }
    
}
