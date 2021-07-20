//
//  ViewBuilder.swift
//  design
//
//  Created by Grzegorz Gumieniak on 18/07/2021.
//

import Foundation
import SwiftUI

protocol ViewFactoryType {
    func createView(context: PlaceInformation) -> AnyView
}

class ShortDescriptionFactory: ViewFactoryType {
    func createView(context: PlaceInformation) -> AnyView {
        return AnyView(ShortDescription(title: context.title))
    }
}

class LongDescriptionFactory: ViewFactoryType {
    func createView(context: PlaceInformation) -> AnyView {
        return AnyView(LongestDescription(title: context.title, description: context.description))
    }
}

class ViewFactory: ViewFactoryType {
    func createView(context: PlaceInformation) -> AnyView {
        if context.description.count > 0 {
            return LongDescriptionFactory().createView(context: context)
        } else {
            return ShortDescriptionFactory().createView(context: context)
        }
    }
    
}

//class ViewDirector {
//
//    @ViewBuilder func build(page :Page) -> some View {
//        if page.terms != nil {
//            LongestDescription(title: page.title , description: dictToString(dict: page.terms))
//        } else {
//            ShortDescription(title: page.title)
//        }
//    }
//    private func dictToString(dict:[String: [String]]?) -> String {
//        return (dict?["description"]?[0])!
//    }
//}
