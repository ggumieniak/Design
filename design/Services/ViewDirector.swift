//
//  ViewBuilder.swift
//  design
//
//  Created by Grzegorz Gumieniak on 18/07/2021.
//

import Foundation
import SwiftUI


class ViewDirector {
    @ViewBuilder func build(page :Page) -> some View {
        if page.terms != nil {
            LongestDescription(title: page.title , description: dictToString(dict: page.terms))
        } else {
            ShortDescription(title: page.title)
        }
    }
    private func dictToString(dict:[String: [String]]?) -> String {
        return (dict?["description"]?[0])!
    }
}
