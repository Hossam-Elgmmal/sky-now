//
//  CityData.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//

import Foundation


struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let country: String
    let lat: Double
    let lon: Double

    var displayName: String { "\(name), \(country)" }
}

// MARK: - Static global cities list
extension City {
    static let all: [City] = [
        City(name: "Cairo",        country: "Egypt",           lat: 30.0444, lon: 31.2357),
        City(name: "Alexandria",   country: "Egypt",           lat: 31.2001, lon: 29.9187),
        City(name: "New York",     country: "United States",   lat: 40.7128, lon: -74.0060),
        City(name: "Los Angeles",  country: "United States",   lat: 34.0522, lon: -118.2437),
        City(name: "Chicago",      country: "United States",   lat: 41.8781, lon: -87.6298),
        City(name: "London",       country: "United Kingdom",  lat: 51.5074, lon: -0.1278),
        City(name: "Manchester",   country: "United Kingdom",  lat: 53.4808, lon: -2.2426),
        City(name: "Paris",        country: "France",          lat: 48.8566, lon: 2.3522),
        City(name: "Berlin",       country: "Germany",         lat: 52.5200, lon: 13.4050),
        City(name: "Munich",       country: "Germany",         lat: 48.1351, lon: 11.5820),
        City(name: "Madrid",       country: "Spain",           lat: 40.4168, lon: -3.7038),
        City(name: "Barcelona",    country: "Spain",           lat: 41.3851, lon: 2.1734),
        City(name: "Rome",         country: "Italy",           lat: 41.9028, lon: 12.4964),
        City(name: "Milan",        country: "Italy",           lat: 45.4642, lon: 9.1900),
        City(name: "Amsterdam",    country: "Netherlands",     lat: 52.3676, lon: 4.9041),
        City(name: "Brussels",     country: "Belgium",         lat: 50.8503, lon: 4.3517),
        City(name: "Vienna",       country: "Austria",         lat: 48.2082, lon: 16.3738),
        City(name: "Zurich",       country: "Switzerland",     lat: 47.3769, lon: 8.5417),
        City(name: "Stockholm",    country: "Sweden",          lat: 59.3293, lon: 18.0686),
        City(name: "Oslo",         country: "Norway",          lat: 59.9139, lon: 10.7522),
        City(name: "Copenhagen",   country: "Denmark",         lat: 55.6761, lon: 12.5683),
        City(name: "Helsinki",     country: "Finland",         lat: 60.1699, lon: 24.9384),
        City(name: "Warsaw",       country: "Poland",          lat: 52.2297, lon: 21.0122),
        City(name: "Prague",       country: "Czech Republic",  lat: 50.0755, lon: 14.4378),
        City(name: "Budapest",     country: "Hungary",         lat: 47.4979, lon: 19.0402),
        City(name: "Athens",       country: "Greece",          lat: 37.9838, lon: 23.7275),
        City(name: "Istanbul",     country: "Turkey",          lat: 41.0082, lon: 28.9784),
        City(name: "Ankara",       country: "Turkey",          lat: 39.9334, lon: 32.8597),
        City(name: "Moscow",       country: "Russia",          lat: 55.7558, lon: 37.6173),
        City(name: "Dubai",        country: "UAE",             lat: 25.2048, lon: 55.2708),
        City(name: "Abu Dhabi",    country: "UAE",             lat: 24.4539, lon: 54.3773),
        City(name: "Riyadh",       country: "Saudi Arabia",    lat: 24.7136, lon: 46.6753),
        City(name: "Jeddah",       country: "Saudi Arabia",    lat: 21.5433, lon: 39.1728),
        City(name: "Kuwait City",  country: "Kuwait",          lat: 29.3759, lon: 47.9774),
        City(name: "Doha",         country: "Qatar",           lat: 25.2854, lon: 51.5310),
        City(name: "Beirut",       country: "Lebanon",         lat: 33.8938, lon: 35.5018),
        City(name: "Amman",        country: "Jordan",          lat: 31.9454, lon: 35.9284),
        City(name: "Baghdad",      country: "Iraq",            lat: 33.3152, lon: 44.3661),
        City(name: "Tehran",       country: "Iran",            lat: 35.6892, lon: 51.3890),
        City(name: "Karachi",      country: "Pakistan",        lat: 24.8607, lon: 67.0011),
        City(name: "Lahore",       country: "Pakistan",        lat: 31.5204, lon: 74.3587),
        City(name: "Mumbai",       country: "India",           lat: 19.0760, lon: 72.8777),
        City(name: "Delhi",        country: "India",           lat: 28.6139, lon: 77.2090),
        City(name: "Bangalore",    country: "India",           lat: 12.9716, lon: 77.5946),
        City(name: "Kolkata",      country: "India",           lat: 22.5726, lon: 88.3639),
        City(name: "Dhaka",        country: "Bangladesh",      lat: 23.8103, lon: 90.4125),
        City(name: "Colombo",      country: "Sri Lanka",       lat: 6.9271,  lon: 79.8612),
        City(name: "Kathmandu",    country: "Nepal",           lat: 27.7172, lon: 85.3240),
        City(name: "Beijing",      country: "China",           lat: 39.9042, lon: 116.4074),
        City(name: "Shanghai",     country: "China",           lat: 31.2304, lon: 121.4737),
        City(name: "Guangzhou",    country: "China",           lat: 23.1291, lon: 113.2644),
        City(name: "Shenzhen",     country: "China",           lat: 22.5431, lon: 114.0579),
        City(name: "Hong Kong",    country: "China",           lat: 22.3193, lon: 114.1694),
        City(name: "Tokyo",        country: "Japan",           lat: 35.6762, lon: 139.6503),
        City(name: "Osaka",        country: "Japan",           lat: 34.6937, lon: 135.5023),
        City(name: "Seoul",        country: "South Korea",     lat: 37.5665, lon: 126.9780),
        City(name: "Taipei",       country: "Taiwan",          lat: 25.0330, lon: 121.5654),
        City(name: "Singapore",    country: "Singapore",       lat: 1.3521,  lon: 103.8198),
        City(name: "Kuala Lumpur", country: "Malaysia",        lat: 3.1390,  lon: 101.6869),
        City(name: "Jakarta",      country: "Indonesia",       lat: -6.2088, lon: 106.8456),
        City(name: "Bangkok",      country: "Thailand",        lat: 13.7563, lon: 100.5018),
        City(name: "Manila",       country: "Philippines",     lat: 14.5995, lon: 120.9842),
        City(name: "Ho Chi Minh",  country: "Vietnam",         lat: 10.8231, lon: 106.6297),
        City(name: "Hanoi",        country: "Vietnam",         lat: 21.0285, lon: 105.8542),
        City(name: "Nairobi",      country: "Kenya",           lat: -1.2921, lon: 36.8219),
        City(name: "Lagos",        country: "Nigeria",         lat: 6.5244,  lon: 3.3792),
        City(name: "Accra",        country: "Ghana",           lat: 5.6037,  lon: -0.1870),
        City(name: "Addis Ababa",  country: "Ethiopia",        lat: 9.0320,  lon: 38.7469),
        City(name: "Casablanca",   country: "Morocco",         lat: 33.5731, lon: -7.5898),
        City(name: "Tunis",        country: "Tunisia",         lat: 36.8065, lon: 10.1815),
        City(name: "Algiers",      country: "Algeria",         lat: 36.7372, lon: 3.0865),
        City(name: "Johannesburg", country: "South Africa",    lat: -26.2041, lon: 28.0473),
        City(name: "Cape Town",    country: "South Africa",    lat: -33.9249, lon: 18.4241),
        City(name: "São Paulo",    country: "Brazil",          lat: -23.5505, lon: -46.6333),
        City(name: "Rio de Janeiro", country: "Brazil",        lat: -22.9068, lon: -43.1729),
        City(name: "Buenos Aires", country: "Argentina",       lat: -34.6037, lon: -58.3816),
        City(name: "Santiago",     country: "Chile",           lat: -33.4489, lon: -70.6693),
        City(name: "Lima",         country: "Peru",            lat: -12.0464, lon: -77.0428),
        City(name: "Bogotá",       country: "Colombia",        lat: 4.7110,   lon: -74.0721),
        City(name: "Mexico City",  country: "Mexico",          lat: 19.4326,  lon: -99.1332),
        City(name: "Toronto",      country: "Canada",          lat: 43.6532,  lon: -79.3832),
        City(name: "Vancouver",    country: "Canada",          lat: 49.2827,  lon: -123.1207),
        City(name: "Montreal",     country: "Canada",          lat: 45.5017,  lon: -73.5673),
        City(name: "Sydney",       country: "Australia",       lat: -33.8688, lon: 151.2093),
        City(name: "Melbourne",    country: "Australia",       lat: -37.8136, lon: 144.9631),
        City(name: "Brisbane",     country: "Australia",       lat: -27.4698, lon: 153.0251),
        City(name: "Auckland",     country: "New Zealand",     lat: -36.8485, lon: 174.7633),
    ]
}
