//
//  ContentViewModel.swift
//  design
//
//  Created by Grzegorz Gumieniak on 17/07/2021.
//

import Foundation
import MapKit
import Combine

class ContentViewModel: ObservableObject {
    @Published var centerCoordinate = CLLocationCoordinate2D()
    @Published var locations = [CodableMKPointAnnotation]()
    @Published var selectedPlace: MKPointAnnotation?
    @Published var showingPlaceDetails = false
    @Published var showingEditScreen = false
    
    func getLocations() {
        locations = DataManager.shared.getSavedLocations()
    }
    
    func saveLocations() {
        DataManager.shared.saveLocations(locations: locations)
    }
}
