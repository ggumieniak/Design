//
//  Page+Placeinformation.swift
//  design
//
//  Created by Grzegorz Gumieniak on 19/07/2021.
//

import Foundation

extension Page: PlaceInformationAdapter {
    func getInformation() -> PlaceInformation {
        return PlaceInformation(title: title, description: dictToDescription(dict: terms))
    }
    
    private func dictToDescription(dict:[String: [String]]?) -> String {
        return (dict?["description"]?[0]) ?? ""
    }
}
