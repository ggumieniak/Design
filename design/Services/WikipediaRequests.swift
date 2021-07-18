//
//  WikipediaRequests.swift
//  design
//
//  Created by Grzegorz Gumieniak on 17/07/2021.
//

import Foundation
import MapKit

enum LoadingState {
    case loading, loaded, failed
}

final class WikipediaRequests {

    
    public func fetchNearbyPlaces(in placemark: MKPointAnnotation, using get: @escaping ([Page]) -> ()) {
        let urlString = "https://pl.wikipedia.org/w/api.php?ggscoord=\(placemark.coordinate.latitude)%7C\(placemark.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        guard let url = URL(string: urlString) else {
            print("Bad URL \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let items = try? decoder.decode(Result.self, from: data) {
                    get(Array(items.query.pages.values))
                    return
                }
            }
        }.resume()
    }
}
