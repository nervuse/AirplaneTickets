//
//  DetailTableViewCell.swift
//  AirplaneTickets
//
//  Created by elena on 06.06.2022.
//

import UIKit

//protocol DetailTableViewCellProtocol: AnyObject {
//    func tapLikeButton(_ sender: UIButton)
//}

class DetailTableViewCell: UITableViewCell {

  //  weak var delegate: DetailTableViewCellProtocol?

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
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewCity: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewDate: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var startCityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
        label.textColor = .white
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
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
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var flyImage: UIImageView = {
        let picture = UIImage(named: "plane2")
        let image = UIImageView(image: picture)
        image.clipsToBounds = true
        image.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var startDateTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var endDateTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackViewInfo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "Georgia", size: 20)
        label.textColor = .white
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let images = UIImage(named: "heart")
        let button = UIButton()
        button.setImage(images, for: .normal)
        button.clipsToBounds = true
        button.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapShowLikeInButton), for: .touchUpInside)
        return button
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()

        label.text = "ВНИМАНИЕ! АЭРОПОРТЫ НА ЮГЕ ЗАКРЫТЫ, ПОЛЕТЫ ПРИОСТАНОВЛЕНЫ ДО 12 ИЮНЯ! Закрыты аэропорты Анапы, Белгорода, Брянска, Воронежа, Геленджика, Краснодара, Курска, Липецка, Ростова-на-Дону, Симферополя, Элисты"
        label.numberOfLines = 0

        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemRed
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(UILayoutPriority(700), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tapButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)

        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.backgroundColor = UIColor(hexString: "4B7BE5").withAlphaComponent(0.3)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Купить", for: .normal)
        return button
    }()

    
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

        self.stackView.addArrangedSubview(self.stackViewCity)
        self.stackView.addArrangedSubview(self.stackViewDate)
        self.stackView.addArrangedSubview(self.stackViewInfo)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.tapButton)
        
        self.stackViewCity.addArrangedSubview(self.startCityLabel)
        self.stackViewCity.addArrangedSubview(self.flyImage)
        self.stackViewCity.addArrangedSubview(self.endCityLabel)
        self.stackViewDate.addArrangedSubview(self.startDateTitle)
        self.stackViewDate.addArrangedSubview(self.endDateTitle)
        
        self.stackViewInfo.addArrangedSubview(self.priceLabel)
        self.stackViewInfo.addArrangedSubview(self.likeButton)

        let topBackConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)
        let leadingBackConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        let trailingBackConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        let bottomBackConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        let height = self.backView.heightAnchor.constraint(equalToConstant: 450)

        let bottomTapButtonConstraint = self.tapButton.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10)
        
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        
        NSLayoutConstraint.activate([height, topBackConstraint, leadingBackConstraint, trailingBackConstraint, bottomBackConstraint, bottomTapButtonConstraint, topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
}


