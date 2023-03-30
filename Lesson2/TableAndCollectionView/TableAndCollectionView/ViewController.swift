//
//  ViewController.swift
//  TableView
//
//  Created by Yernur on 29.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var randomArray = (1...100).map {_ in arc4random() }
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // make sure that there is a slightly larger gap at the top of each row
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        // set a standard item size of 60 * 60
        layout.itemSize = CGSize(width: 60, height: 60)
        // the layout scrolls horizontally
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        return collectionView
    }()
    
    override func loadView() {
        super.loadView()
        view = collectionView
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.contentView.backgroundColor = .blue
        return cell
    }
}
