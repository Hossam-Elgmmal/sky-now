//
//  SearchViewModel.swift
//  SkyNow
//
//  Created by Hossam on 11/06/2026.
//
import SwiftUI
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var query = ""
    @Published private(set) var results: [City] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        $query
            .debounce(for: .milliseconds(150), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { q -> [City] in
                let trimmed = q.trimmingCharacters(in: .whitespaces)
                guard !trimmed.isEmpty else { return [] }
                return City.all.filter {
                    $0.name.localizedCaseInsensitiveContains(trimmed) ||
                    $0.country.localizedCaseInsensitiveContains(trimmed)
                }
            }
            .assign(to: &$results)
    }
}
