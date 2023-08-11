//
//  APIRouter.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation

class APIRouter {
    
    // POST request
    struct GetHotels: Request {
        typealias ReturnType = DataResponse
        var path: String = "properties/v2/list"
        var method: HTTPMethod = .post
        var body: [String : Any]?
        init(body: APIParameters.PropertySearchHotelsParams) {
            self.body = body.asDictionary
        }
    }
    
    struct GetHotelDetails: Request {
        typealias ReturnType = HotelDetailsModel
        var path: String = "properties/v2/detail"
        var method: HTTPMethod = .post
        var body: [String : Any]?
        init(body: APIParameters.PropertyDetailsParams) {
            self.body = body.asDictionary
        }
    }
}
