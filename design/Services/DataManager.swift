//
//  DataManager.swift
//  design
//
//  Created by Grzegorz Gumieniak on 17/07/2021.
//

import Foundation
import MapKit

final class DataManager {
    static let shared = DataManager()
    private let filePersistency = FilePersistency()
    private let wikipediaDescription = WikipediaRequests()
    private init() {}
    
    func getSavedLocations() -> [CodableMKPointAnnotation] {
        return filePersistency.loadData()
    }
    
    func saveLocations(locations: [CodableMKPointAnnotation]) {
        return filePersistency.saveData(locations: locations)
    }
    
    func getPlaceNearby(at placemark: MKPointAnnotation, page closure: @escaping ([Page]) -> ()){
        wikipediaDescription.fetchNearbyPlaces(in: placemark, using: { pages in
            closure(pages)
        })
    }
}
