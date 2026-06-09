//
//  NetworkClient.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation

protocol NetworkClient {
    func fetch<T: Decodable>(
        _ type: T.Type,
        from urlString: String
    ) async -> Result<T, WeatherError>
}

final class NetworkClientImp: NetworkClient {

    func fetch<T: Decodable>(
        _ type: T.Type,
        from urlString: String
    ) async -> Result<T, WeatherError> {
        
        guard let url = URL(string: urlString) else {
            return .failure(.invalidURL)
        }

        let data: Data
        let response: URLResponse

        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch let urlError as URLError {
            switch urlError.code {
            case .notConnectedToInternet, .networkConnectionLost:
                return .failure(.noInternet)

            case .timedOut:
                return .failure(.timeout)

            default:
                return .failure(.unknown(urlError))
            }
        } catch {
            return .failure(.unknown(error))
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.badResponse(statusCode: 0))
        }

        switch httpResponse.statusCode {
        case 200...299:
            break

        case 400:
            return .failure(.locationNotFound)

        case 401, 403:
            return .failure(.invalidAPIKey)

        case 429:
            return .failure(.quotaExceeded)

        default:
            return .failure(.badResponse(statusCode: httpResponse.statusCode))
        }

        do {
            let decoded = try JSONDecoder().decode(type, from: data)
            return .success(decoded)
        } catch {
            return .failure(.decodingFailed)
        }
    }
}
