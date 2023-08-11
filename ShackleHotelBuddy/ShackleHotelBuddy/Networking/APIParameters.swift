//
//  APIParameters.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation

protocol DictionaryConvertor: Codable {}


//MARK: APIParameters for using in URLrequests
/// Structs that containg all parameters that needed for passing data as body or queary strings to urlrequest
/// it is conforimig to DictionaryConvertor
struct APIParameters{
    
    struct PropertyDetailsParams: Encodable {
        var propertyId: String?
    }
    
    struct PropertySearchHotelsParams: Encodable {
        var destination: [String:String] = ["regionId": "6054439"] 
        var checkInDate: checkDates
        var checkOutDate: checkDates
        var rooms: [guests]
        var filters: filerPrice
        var star: [Int] = [10,20,30,40,50] // add to filer call
    }
    
    struct checkDates: Encodable {
        var day: Int
        var month: Int
        var year: Int
    }
    
    struct guests: Encodable {
        var adults: Int
        var children: [[String:Int]]
    }
    
    struct filerPrice: Encodable {
        var price: [filerPriceValues]
    }
    
    struct filerPriceValues: Encodable {
        var max: Int
        var min: Int
    }
    
    struct searchHotels: Encodable {
        
    }
}
