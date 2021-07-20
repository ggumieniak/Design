//
//  PlaceInformation.swift
//  design
//
//  Created by Grzegorz Gumieniak on 19/07/2021.
//

import Foundation

protocol PlaceInformationAdapter {
    func getInformation() -> PlaceInformation
}

struct PlaceInformation {
    var title: String
    var description: String
    func getInformation() -> PlaceInformation {
        return self
    }
}
