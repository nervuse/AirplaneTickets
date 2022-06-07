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
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
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
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
}


extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.startCityLabel.text = city?.startCity
        cell.endCityLabel.text = city?.endCity
        cell.priceLabel.text = "Price: " + "\(city?.price ?? 0)"
        
        let startDate = city?.startDate
        let endDate = city?.endDate
        
        if let date = startDate?.toDate(withFormat: startDate ?? "") {
            cell.startDateTitle.text = "Дата отправления: " + "\(date)"
        }
        
        if let date = endDate?.toDate(withFormat: endDate ?? "") {
            cell.endDateTitle.text = "Дата возвращения: " + "\(date)"
        }
        
        return cell
    }
}
