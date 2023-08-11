//
//  APIConstants.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation

final class APIConstants {
    static var basedURL: String = "https://hotels4.p.rapidapi.com/"
    static var apiKey: String = "61d1173938msh1e9f82eb1e805eep18219ejsn00242186b044"
    static var hostKey: String = "hotels4.p.rapidapi.com"
}

enum HTTPHeaderField: String {
    case authentication = "Authentication"
    case contentType = "content-type"
    case hostKey = "X-RapidAPI-Host"
    case authorization = "X-RapidAPI-Key"
}

enum ContentType: String {
    case json = "application/json"
}
