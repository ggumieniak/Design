//
//  ContentView.swift
//  design
//
//  Created by Grzegorz Gumieniak on 16/07/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $viewModel.centerCoordinate, selectedPlace: $viewModel.selectedPlace, showingPlaceDetails: $viewModel.showingPlaceDetails, annotations: viewModel.locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.title = "Nazwa"
                        newLocation.subtitle = "Opis"
                        newLocation.coordinate = viewModel.centerCoordinate
                        viewModel.locations.append(newLocation)
                        viewModel.selectedPlace = newLocation
                        viewModel.showingEditScreen = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(Color.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .alert(isPresented: $viewModel.showingPlaceDetails) {
            Alert(title: Text(viewModel.selectedPlace?.title ?? "Nieznane"), message: Text(viewModel.selectedPlace?.subtitle ?? "Brak opisu"), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edytuj")){
                viewModel.showingEditScreen = true
            })
        }.sheet(isPresented: $viewModel.showingEditScreen,onDismiss: viewModel.saveLocations, content: {
            if viewModel.selectedPlace != nil {
                EditView(placemark: viewModel.selectedPlace!)
            }
        })
        .onAppear(perform: viewModel.getLocations)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
