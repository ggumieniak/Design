//
//  LongestDescription.swift
//  design
//
//  Created by Grzegorz Gumieniak on 18/07/2021.
//

import SwiftUI

struct LongestDescription: View {
    @State var title: String
    @State var description: String
    var body: some View {
        Text(title)
            .font(.headline)
            + Text(": ")
            + Text(description)
    }
}

struct LongestDescription_Previews: PreviewProvider {
    static var previews: some View {
        LongestDescription(title: "Title", description: "Description")
    }
}
