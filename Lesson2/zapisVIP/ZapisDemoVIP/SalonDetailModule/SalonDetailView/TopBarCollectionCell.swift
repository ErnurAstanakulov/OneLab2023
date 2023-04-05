//
//  TopBarCollectionCell.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit
import Kingfisher

class TopBarCollectionCell: UICollectionViewCell {
    
    private var pictureImageView = UIImageView()
    var pictureUrl: String?{
        didSet {
            guard let pictureUrl = pictureUrl else { fatalError(" pictureUrl is nil ")}
            pictureImageView.kf.setImage(with: URL(string: host + pictureUrl))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TopBarCollectionCell: ViewInitilizeProtocol {
    func addSubviews() {
        addSubview(pictureImageView)
    }
    
    func setupConstraints() {
        pictureImageView.addConstaintsToFill()
    }
    
    func stylizeViews() {
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.clipsToBounds = true
    }
    
    
}
