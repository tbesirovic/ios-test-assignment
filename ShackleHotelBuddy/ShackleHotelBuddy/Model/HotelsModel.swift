//
//  HotelsModel.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation

struct DataResponse: Codable, Hashable {
    let data: PropertySearch?
}

struct PropertySearch: Codable, Hashable {
    let summary: PropertySummary
    let propertySearch: HotelsModel
    let __typename: String
}

struct PropertySummary: Codable, Hashable {
    let matchedPropertiesSize: Int
}

struct HotelsModel: Codable, Hashable {
    let properties: [HotelModel]
}

struct HotelModel: Codable, Hashable {
    let name: String
    let id: String
}



