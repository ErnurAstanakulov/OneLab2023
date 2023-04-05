//
//  SalonListCollectionCell.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit
import Kingfisher

class SalonListCollectionCell: UICollectionViewCell {
    
    private let cardView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    
    public func fill(_ model: Fruit) {
        guard let url = model.pictureUrl else { fatalError("pictureUrl is nil ")}
        iconImageView.kf.setImage(with: URL(string: url))
        titleLabel.text = model.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        iconImageView.image = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SalonListCollectionCell: ViewInitilizeProtocol {
    func addSubviews() {
        contentView.addSubview(cardView)
        [iconImageView,titleLabel].forEach { cardView.addSubview($0)}
    }
    
    func setupConstraints() {
        cardView.addConstaintsToFill(padding: 8)
        
        var layoutConstraints = [NSLayoutConstraint]()
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            iconImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            iconImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 150),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        ]
        
        titleLabel.addConstaintsToHorizontal(padding: 8)
        layoutConstraints += [
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16),
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func stylizeViews() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        
        titleLabel.numberOfLines = 0
        cardView.backgroundColor = .white
        
        cardView.layer.cornerRadius = 16
        cardView.layer.masksToBounds = true
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        cardView.layer.shadowRadius = 8
        
        iconImageView.layer.cornerRadius = 16
        iconImageView.layer.masksToBounds = true
    }
}
