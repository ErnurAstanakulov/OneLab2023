//
//  TopBarPicturePageView.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit

class TopBarPicturePageView: UIView {
    
    private var collectionView: UICollectionView!
    private var pageControll = UIPageControl()
    private var pictures: [String] = []
    
    func fillPicture(_ pictures: [String]) {
        self.pictures = pictures
        collectionView.reloadData()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension TopBarPicturePageView: ViewInitilizeProtocol {
    
    func addSubviews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(collectionView)
        addSubview(pageControll)
//        insertSubview(pageControll, at: 0)
//        bringSubviewToFront(pageControll)
    }
    
    func setupConstraints() {
        collectionView.addConstaintsToFill()
        pageControll.addConstaintsToHorizontal(padding: 32)
        pageControll.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pageControll.heightAnchor.constraint(equalToConstant: 32).isActive = true
        pageControll.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func stylizeViews() {
        collectionView.backgroundColor = .white
        collectionView.contentInset = .zero
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    
        pageControll.currentPage = 0
        pageControll.numberOfPages = pictures.count
        pageControll.hidesForSinglePage = true
    }
    func extraTasks() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TopBarCollectionCell.self, forCellWithReuseIdentifier: "TopBarCollectionCell")
    }
}

extension TopBarPicturePageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("pick")
        dump(pictures.count)
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopBarCollectionCell", for: indexPath) as? TopBarCollectionCell
            else { fatalError("TopBarCollectionCell not registred")}
        cell.pictureUrl = pictures[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControll.currentPage = indexPath.item
    }
}
