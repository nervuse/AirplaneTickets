//
//  DetailViewController.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var city: City?

    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()

        setupView()

        self.view.backgroundColor = UIColor(hexString: "CB11AB")

    }

    private func setupView() {
        view.addSubview(detailView)

        detailView.translatesAutoresizingMaskIntoConstraints = false
    //    detailView.delegate = self

        NSLayoutConstraint.activate([
//            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150),
//            detailView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)

            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }



    private func setupNavigationBar() {
//        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Детали путешествия"
        self.navigationItem.backButtonTitle = ""

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

}


//extension DetailViewController : DetailViewDelegate {
//    func buttonTapped() {
//        dismiss(animated: true)
//    }
//}


