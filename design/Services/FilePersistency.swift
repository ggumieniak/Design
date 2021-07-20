//
//  FilePersistency.swift
//  design
//
//  Created by Grzegorz Gumieniak on 17/07/2021.
//

import Foundation
final class FilePersistency {
    
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() -> [CodableMKPointAnnotation] {
        let fileName = getDocumentDirectory().appendingPathComponent("SavedPlaces")
        do {
            let data = try Data(contentsOf: fileName)
            let locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
            return locations
        } catch {
            print("Unable to load data.")
            return [CodableMKPointAnnotation]()
            
        }
    }
    
    func saveData(locations: [CodableMKPointAnnotation]) {
        do {
            let fileName = getDocumentDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(locations)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
}
