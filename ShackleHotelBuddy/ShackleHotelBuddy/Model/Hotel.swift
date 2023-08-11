//
//  Hotel.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/9/23.
//

import Foundation

struct Hotel: Identifiable, Hashable {
    let id: String
    let name: String
    let location: String
    let image: String
    let price: Int
    let rating: Int
}
