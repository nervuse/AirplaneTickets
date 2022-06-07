//
//  Travel.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//

import UIKit

struct Travel: Decodable {
    
    var data: [City]
}

struct City: Decodable {
    
    var startCity: String
    var endCity: String
    var startDate: String
    var endDate: String
    var price: Int
    
    enum CodingKeys: String, CodingKey {
        case startCity, endCity, startDate, endDate, price
    }
}
