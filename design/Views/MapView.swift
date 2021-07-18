//
//  MapView.swift
//  design
//
//  Created by Grzegorz Gumieniak on 16/07/2021.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable  {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    var annotations: [MKPointAnnotation] {
        willSet {
            print("New Value")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifer = "Placemark"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifer)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifer)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }
            parent.selectedPlace = placemark
            parent.showingPlaceDetails = true
        }
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView;
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if annotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(annotations)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View  {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate),selectedPlace: .constant(MKPointAnnotation.example),showingPlaceDetails: .constant(false), annotations: [MKPointAnnotation.example])
    }
}


extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Okolice stalowej Woli"
        annotation.subtitle = "Orki z majorki!"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 50.34, longitude: 22.03)
        return annotation
    }
}
