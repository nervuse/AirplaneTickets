//
//  FlyTableViewCell.swift
//  AirplaneTickets
//
//  Created by elena on 03.06.2022.
//


import UIKit

class FlyTableViewCell: UITableViewCell {

//    struct ViewModel: ViewModelProtocol {
//        let startCity: String
//        let endCity: String
//        let startDate: String
//        let endDate: String
//        let price: Int
//    }

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.backgroundColor = UIColor(hexString: "990099")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewCity: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
    //    stackView.setContentCompressionResistancePriority(UILayoutPriority(500), for: .vertical)
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewDate: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
  //      stackView.setContentCompressionResistancePriority(UILayoutPriority(500), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var startCityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
   //     label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
        label.textColor = .white
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var endCityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
        label.textColor = .white
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var flyImage: UIImageView = {
        let picture = UIImage(named: "plane2")
        let image = UIImageView(image: picture)
        image.clipsToBounds = true
        image.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
       // button.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        return image
    }()

    lazy var startDateTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var endDateTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var stackViewInfo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()


    lazy var priceLabel: UILabel = {
        let label = UILabel()
    //    label.numberOfLines = 0

    //    label.backgroundColor = .clear
        
        label.font = UIFont(name: "Georgia", size: 17)
        label.textColor = .white
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
   //     label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var likeButton: UIButton = {
        let images = UIImage(named: "heart")
        let button = UIButton()
        button.setImage(images, for: .normal)
        button.clipsToBounds = true
     //   button.contentMode = .scaleAspectFit
        button.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapShowLikeInButton), for: .touchUpInside)
        return button
    }()

//    private lazy var likeImage: UIImageView = {
//        let picture = UIImage(named: "heart")
//        let image = UIImageView(image: picture)
//        image.contentMode = .scaleAspectFit
//        image.clipsToBounds = true
//        image.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.startCityLabel.text = nil
        self.endCityLabel.text = nil
        self.startDateTitle.text = nil
        self.endDateTitle.text = nil
        self.priceLabel.text = nil

    }

    @objc private func tapShowLikeInButton(_ sender: UIButton) {

        let button = sender
        
        if button.isSelected == true {
            button.setImage(UIImage(named: "heart"), for: .normal)
            button.isSelected = false
        } else {
            button.setImage(UIImage(named: "blackheart"), for: .normal)
            button.isSelected = true
        }
    }

    private func setupView() {
        self.contentView.backgroundColor = UIColor(hexString: "CB11AB")

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(stackViewCity)
        self.stackView.addArrangedSubview(stackViewDate)
        self.stackView.addArrangedSubview(stackViewInfo)

        self.stackViewCity.addArrangedSubview(self.startCityLabel)
        self.stackViewCity.addArrangedSubview(self.flyImage)
        self.stackViewCity.addArrangedSubview(self.endCityLabel)
        self.stackViewDate.addArrangedSubview(self.startDateTitle)
        self.stackViewDate.addArrangedSubview(self.endDateTitle)

        self.stackViewInfo.addArrangedSubview(self.priceLabel)
        self.stackViewInfo.addArrangedSubview(self.likeButton)
//        self.stackViewInfo.addArrangedSubview(self.likeImage)



        let backViewConstraints = self.backViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()

        NSLayoutConstraint.activate(backViewConstraints + stackViewConstraints)
    }

    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }

    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 10)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -10)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
}

//extension FlyTableViewCell: Setupable {
//
//    func setup(with viewModel: ViewModelProtocol) {
//        guard let viewModel = viewModel as? ViewModel else { return }
//
//        self.startCityLabel.text = viewModel.startCity
//        self.endCityLabel.text = viewModel.endCity
//        self.startDateTitle.text = viewModel.startDate
//        self.endDateTitle.text = viewModel.endDate
//        self.priceLabel.text = "Price: " +  String(viewModel.price)
//
//    }
//}
