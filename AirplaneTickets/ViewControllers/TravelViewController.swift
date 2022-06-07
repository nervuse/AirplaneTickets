//
//  TravelViewController.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//


import UIKit


class TravelViewController: UIViewController {

    var indicator = UIActivityIndicatorView()

    let networkDataFetcher = NetworkDataFetcher()
    
    var travel: [City] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
     //   tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(FlyTableViewCell.self, forCellReuseIdentifier: "FlyCell")
        tableView.backgroundColor = UIColor(hexString: "CB11AB")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.fetchCity()

        self.activityIndicator()
        self.indicator.startAnimating()

    }

    private func fetchCity() {

        let urlString = "https://travel.wildberries.ru/statistics/v1/cheap"

        self.networkDataFetcher.fetchTicket(urlString: urlString) { travel in
                guard let travel = travel?.data else { return }
                self.travel = travel
                self.tableView.reloadData()
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
            }
    }

    private func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.color = .white
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Билеты на самолет"


        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(hexString: "CB11AB")
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
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

extension TravelViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlyCell", for: indexPath) as? FlyTableViewCell else {
           // let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return UITableViewCell()
        }

        let city = travel[indexPath.row]
        cell.startCityLabel.text = city.startCity
        cell.endCityLabel.text = city.endCity
        cell.startDateTitle.text = city.startDate
        cell.endDateTitle.text = city.endDate
        cell.priceLabel.text = "Price: " + String(city.price)
        
//        let viewModel = FlyTableViewCell.ViewModel(startCity: city.startCity, endCity: city.endCity, startDate: city.startDate, endDate: city.endDate, price: city.price)
//        cell.setup(with: viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        


//        let detailViewController = DetailViewController()
//    //    present(detailViewController, animated: true)
//        self.navigationController?.show(detailViewController, sender: nil)


    let detailsViewController = DetailsViewController()
        detailsViewController.city = travel[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
