//
//  Persistence.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//
import CoreData
import Combine

final class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "SkyNow")
        container.loadPersistentStores { _, error in
            if let error = error { fatalError("CoreData failed: \(error)") }
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

extension SavedCity {
    var city: City {
        City(
            name: name ?? "",
            country: country ?? "",
            lat: lat,
            lon: lon
        )
    }
}

@MainActor
final class SavedCitiesStore: ObservableObject {
    @Published private(set) var saved: [SavedCity] = []

    private let ctx: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.ctx = context
        fetch()
    }

    func isSaved(_ city: City) -> Bool {
        saved.contains { $0.name == city.name && $0.country == city.country }
    }

    func toggle(_ city: City) {
        if let existing = saved.first(where: { $0.name == city.name && $0.country == city.country }) {
            ctx.delete(existing)
        } else {
            let entity = SavedCity(context: ctx)
            entity.id = UUID()
            entity.name = city.name
            entity.country = city.country
            entity.lat = city.lat
            entity.lon = city.lon
            entity.addedAt = Date()
        }
        save()
    }

    func delete(at offsets: IndexSet) {
        offsets.map { saved[$0] }.forEach(ctx.delete)
        save()
    }

    private func fetch() {
        let req = SavedCity.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(keyPath: \SavedCity.addedAt, ascending: true)]
        saved = (try? ctx.fetch(req)) ?? []
    }

    private func save() {
        guard ctx.hasChanges else { return }
        try? ctx.save()
        fetch()
    }
}
