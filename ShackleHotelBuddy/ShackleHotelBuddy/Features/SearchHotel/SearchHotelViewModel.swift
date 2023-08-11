//
//  SearchHotelViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation
import Combine

extension SearchHotelContentView {
    @MainActor class SearchHotelViewModel: ObservableObject {
                        
        @Published var checkInDate = Date()
        @Published var checkOutDate = Date()
        @Published var numberOfGuests = 1
        @Published var numberOfChildren = 0
        
        
        var cancelable: Set<AnyCancellable> = []
        @Published var hotelsDataReceived: Bool = false
        
        func detailsRequest(propertyId: String) {
            if propertyId.isEmpty { return }
            APIClient.dispatch(
                APIRouter.GetHotelDetails(body:
                                        APIParameters.PropertyDetailsParams(propertyId: propertyId)))
            .sink { _ in
            } receiveValue: { [weak self] product in
                print(product.asDictionary)
                self?.hotelsDataReceived.toggle()
            }.store(in: &cancelable)
        }
        
        func getHotelsRequest() {

            APIClient.dispatch(
                APIRouter.GetHotels(body: APIParameters.PropertySearchHotelsParams(
                    checkInDate: APIParameters.checkDates(
                        day: checkInDate.get(.day),
                        month: checkInDate.get(.month),
                        year: checkInDate.get(.year)),
                    checkOutDate: APIParameters.checkDates(
                        day: checkOutDate.get(.day),
                        month: checkOutDate.get(.month),
                        year: checkOutDate.get(.year)),
                    rooms: [APIParameters.guests(
                        adults: numberOfGuests,
                        children: Array(repeating: ["age":5], count: numberOfChildren))],
                    filters: APIParameters.filerPrice(
                        price: [APIParameters.filerPriceValues(max: 100000, min: 0)]))))
            .sink { _ in
            } receiveValue: { [weak self] hotels in
                print(hotels.asDictionary.count)
                print(hotels)
                self?.hotelsDataReceived.toggle()
            }.store(in: &cancelable)
        }
    }
}

