//
//  Setupable.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
