//
//  HotelSearchResultsViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/7/23.
//

import Foundation

class HotelSearchResultsViewModel: ObservableObject {
        
        @Published var hotels: [Hotel] = []
        
        init() {
                hotels = MockService.simpleData
        }
    
    }
