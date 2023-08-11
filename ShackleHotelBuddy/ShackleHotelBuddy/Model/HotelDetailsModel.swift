//
//  HotelDetailsModel.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation

struct HotelDetailsModel: Codable, Hashable {
    let data: DataRes
}

struct DataRes: Codable, Hashable {
    let propertyInfo: PropertyInfo
}

struct PropertyInfo: Codable, Hashable {
    let summary: Summary
    let propertyGallery: Images
}

struct Summary: Codable, Hashable {
    let id: String
    let name: String
}

struct Images: Codable, Hashable {
    let images: [PropertyImage]
   // let accessibilityLabel: String
}

struct PropertyImage: Codable, Hashable {
    let image: ImageUrl
}

struct ImageUrl: Codable, Hashable {
    let url: String
}
