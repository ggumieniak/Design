//
//  EditView.swift
//  design
//
//  Created by Grzegorz Gumieniak on 16/07/2021.
//

import MapKit
import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var placemark: MKPointAnnotation
    @ObservedObject var viewModel: EditViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Wstaw nazwe", text: $placemark.wrappedTitle)
                    TextField("Opis", text: $placemark.wrappedSubtitle)
                }
                Section(header: Text("Pobliskie")) {
                    if viewModel.loadingState == .loaded {
                        List(viewModel.pages, id: \.pageid) { page in
                            viewModel.viewFactory.createView(context: page.getInformation())
                        }
                    } else if viewModel.loadingState == .loading {
                        Text("Ładowanie")
                    } else {
                        Text("Spróbuj ponownie później")
                    }
                }
            }
            .navigationBarTitle("Edytuj")
            .navigationBarItems(trailing: Button("OK"){
                self.presentationMode.wrappedValue.dismiss()
            })
        }.onAppear(perform: viewModel.getDescriptions)
    }
    
    init(placemark: MKPointAnnotation) {
        self.placemark = placemark
        self.viewModel = EditViewModel(placemark: placemark)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
        
    }
}
