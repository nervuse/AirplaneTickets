//
//  DetailsViewController.swift
//  AirplaneTickets
//
//  Created by elena on 06.06.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    var city: City?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
    //    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailCell")
        tableView.backgroundColor = UIColor(hexString: "CB11AB")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }

    private func setupView() {
        self.view.backgroundColor = UIColor(hexString: "CB11AB")

        self.view.addSubview(self.tableView)

     //   let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let centerY = self.tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        NSLayoutConstraint.activate([centerY,
            leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }


}


extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
   //     return travel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? DetailTableViewCell else {
       //     let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return UITableViewCell()
        }


        cell.startCityLabel.text = city?.startCity
        cell.endCityLabel.text = city?.endCity
        cell.startDateTitle.text = city?.startDate
        cell.endDateTitle.text = city?.endDate
        cell.priceLabel.text = price/(city?.price)


//        let viewModel = FlyTableViewCell.ViewModel(startCity: city.startCity, endCity: city.endCity, startDate: city.startDate, endDate: city.endDate, price: city.price)
//        cell.setup(with: viewModel)
        return cell
    }


}
