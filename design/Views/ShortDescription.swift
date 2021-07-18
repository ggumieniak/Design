//
//  ShortDescription.swift
//  design
//
//  Created by Grzegorz Gumieniak on 18/07/2021.
//

import SwiftUI

struct ShortDescription: View {
    @State var title: String
    var body: some View {
        Text(title)
            .font(.headline)
    }
}

struct ShortDescription_Previews: PreviewProvider {
    static var previews: some View {
        ShortDescription(title: "Description")
    }
}
