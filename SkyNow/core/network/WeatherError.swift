//
//  WeatherError.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation


enum WeatherError: LocalizedError {
    case invalidURL
    case badResponse(statusCode: Int)
    case decodingFailed
    case noInternet
    case timeout
    case quotaExceeded
    case invalidAPIKey
    case locationNotFound
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Something went wrong. Please try again."
        case .badResponse(let statusCode):
            return "Server returned an error (\(statusCode)). Please try again later."
        case .decodingFailed:
            return "Could not read weather data. Please try again."
        case .noInternet:
            return "No internet connection. Check your network and try again."
        case .timeout:
            return "Request timed out. Please try again."
        case .quotaExceeded:
            return "Weather data limit reached. Please try again tomorrow."
        case .invalidAPIKey:
            return "Invalid API key. Please contact support."
        case .locationNotFound:
            return "Location not found. Try a different city."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
