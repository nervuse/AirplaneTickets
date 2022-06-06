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

    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        //df.setLocalizedDateFormatFromTemplate("dd.MM.yy")
        df.locale = Locale(identifier: "en_US")
        return df
    }()

    var startCity: String
    var endCity: String
    var startDate: String
    var endDate: String
    var price: Int


    var startDateString: String {
        return City.dateFormatter.string(from: self.startDate.toDate() ?? Date())
    }

    var endDateString: String {
        return City.dateFormatter.string(from: self.endDate.toDate() ?? Date())
    }

    enum CodingKeys: String, CodingKey {
        case startCity, endCity, startDate, endDate, price
    }

}
