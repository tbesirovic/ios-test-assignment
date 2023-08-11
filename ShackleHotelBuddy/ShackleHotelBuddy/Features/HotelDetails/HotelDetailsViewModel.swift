//
//  HotelDetailsViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/10/23.
//

import Foundation

class HotelDetailsViewModel: ObservableObject {

    @Published var hotel: Hotel

    init(hotel: Hotel) {
        self.hotel = hotel
    }
    
}
