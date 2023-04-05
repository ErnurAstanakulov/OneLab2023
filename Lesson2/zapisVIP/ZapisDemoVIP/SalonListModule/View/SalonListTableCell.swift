//
//  SalonListTableCell.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit

class SalonListTableCell: UITableViewCell {
    
    private var collectionView: UICollectionView!
    private var delegate: SelectedSalonDelegate?
    
    private var layoutHeight: CGFloat {
        return self.bounds.size.height
    }
    
    var models: [Fruit] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    func setDelegate(_ delegate: SelectedSalonDelegate) {
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SalonListTableCell: ViewInitilizeProtocol {
    func addSubviews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.addConstaintsToFill()
    }
    
    func stylizeViews() {
        collectionView.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func extraTasks() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SalonListCollectionCell.self, forCellWithReuseIdentifier: "SalonListCollectionCell")
    }
}
extension SalonListTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalonListCollectionCell", for: indexPath) as? SalonListCollectionCell else {
            fatalError("SalonListCollectionCell not registered")
        }
        cell.fill(models[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openSalon(with: models[indexPath.item].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: layoutHeight, height: layoutHeight)
    }
}

