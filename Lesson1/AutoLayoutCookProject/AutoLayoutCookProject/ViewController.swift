//
//  ViewController.swift
//  AutoLayoutCookProject
//
//  Created by Yernur on 26.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "success")
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .cignika(type: .semibold, size: 32)
        label.textColor = .white
        label.text = "Перевод принят в обработку"
        return label
    }()

    private lazy var transferHistoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("История переводов", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .cignika(type: .regular, size: 18)
        button.layer.cornerRadius = 12.0
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
        return button
    }()
//
    private lazy var addToFavoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить в избранное", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .cignika(type: .regular, size: 18)
        button.layer.cornerRadius = 12.0
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
        return button
    }()
//
//    private lazy var confirmButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Подтвердить", for: .normal)
//        let color = UIColor(red: 199/255, green: 25/255, blue: 96/255, alpha: 1.0)
//        button.setTitleColor(color, for: .normal)
//        button.titleLabel?.font = .cignika(type: .regular, size: 18)
//        button.layer.cornerRadius = 12.0
//        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
//        return button
//    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить fdvdkfmvk", for: .normal)
        let color = UIColor(red: 199/255, green: 25/255, blue: 96/255, alpha: 1.0)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .cignika(type: .regular, size: 18)
        button.layer.cornerRadius = 12.0
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return button
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжит", for: .normal)
        let color = UIColor(red: 199/255, green: 25/255, blue: 96/255, alpha: 1.0)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .cignika(type: .regular, size: 18)
        button.layer.cornerRadius = 12.0
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return button
    }()

    private lazy var actionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [transferHistoryButton, addToFavoriteButton, horizontalStackView])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 8.0
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [continueButton, confirmButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0
        return stackView
    }()

    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor(red: 199/255, green: 25/255, blue: 96/255, alpha: 1.0).cgColor,
            UIColor(red: 139/255, green: 16/255, blue: 74/255, alpha: 1.0).cgColor
        ]
        return gradient
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    @objc private func continueButtonDidTap() {
        print("123")
    }

    private func layoutUI() {
        configureGradient()
        configureImageView()
        configureTitleLabel()
        configureActionStackView()
    }

    private func configureGradient() {
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }

    private func configureImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
    }

    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func configureActionStackView() {
        view.addSubview(actionStackView)
        actionStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
    }
}
