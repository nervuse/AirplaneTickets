//
//  String+extension.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//

import UIKit

extension String {

    func toDate(withFormat format: String) -> String? {
        let inFormatter = ISO8601DateFormatter()
        if let date = inFormatter.date(from: format) {
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateFormat = "dd.MM.yyyy"
            dateFormatter.locale = Locale(identifier: "ru_RU_POSIX")
            return dateFormatter.string(from: date)
        }

        return nil
    }
}


