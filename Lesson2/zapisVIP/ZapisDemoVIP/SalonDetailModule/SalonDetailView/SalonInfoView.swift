//
//  SalonInfoView.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit

class SalonInfoView: UIView {
    
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let mapButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func fillInfo(_ salon: SalonDetailModel) {
        nameLabel.text = salon.salon.name
        descriptionLabel.text = salon.salon.name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SalonInfoView: ViewInitilizeProtocol {
    func addSubviews() {
        [nameLabel, descriptionLabel, mapButton].forEach { addSubview($0) }
    }
    
    func setupConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: mapButton.leadingAnchor, constant: -16)
        ]
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: mapButton.leadingAnchor, constant: -16)
        ]
        
        
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            mapButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mapButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            mapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mapButton.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func stylizeViews() {
        mapButton.setTitle("На карте", for: .normal)
        mapButton.setTitleColor(UIColor.white, for: .normal)
        mapButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        mapButton.layer.cornerRadius = 16
        mapButton.layer.masksToBounds = true
        descriptionLabel.numberOfLines = 0
        
        descriptionLabel.textColor = .lightGray
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mapButton.backgroundColor = .blue
    }
    
}
