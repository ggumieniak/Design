//
//  EditViewModel.swift
//  design
//
//  Created by Grzegorz Gumieniak on 18/07/2021.
//

import Foundation
import MapKit



class EditViewModel: ObservableObject {
    @Published var loadingState = LoadingState.loading
    @Published var pages = [Page]()
    @Published var placemark: MKPointAnnotation
//    var viewBuilder = ViewDirector()
    var viewFactory = ViewFactory()
    
    init(placemark: MKPointAnnotation) {
        self.placemark = placemark
    }
    
    func getDescriptions(){
        DataManager.shared.getPlaceNearby(at: placemark, page: { pages in
            DispatchQueue.main.async {
                if pages.count != 0 {
                    self.pages = pages
                    self.loadingState = .loaded
                } else {
                    self.loadingState = .failed
                }
            }
            
        })
    }
}
