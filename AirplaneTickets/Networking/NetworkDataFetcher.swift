//
//  NetworkDataFetcher.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//

import UIKit

class NetworkDataFetcher {
    
    let networkService = NetworkService()

    func fetchTicket(urlString: String, response: @escaping (Travel?) -> Void) {
        networkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let cities = try JSONDecoder().decode(Travel.self, from: data)
                    response(cities)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
