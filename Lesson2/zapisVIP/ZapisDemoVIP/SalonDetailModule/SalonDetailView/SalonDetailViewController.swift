//
//  SalonDetailViewController.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit
protocol SalonDetailViewProtocol {
    func setInfo(about: SalonDetailModel)
}

class SalonDetailViewController: UIViewController {
    
    private var topBarView = TopBarPicturePageView()
    private var infoView = SalonInfoView()
    
    var interactor: SalonDetailInteractorProtocol?
    var router: SalonDetailRouterProtocol?
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadInfo()
    }
}
extension SalonDetailViewController: SalonDetailViewProtocol {
    func setInfo(about: SalonDetailModel) {
        infoView.fillInfo(about)
        guard let pictures = about.salon.pictures else { fatalError("about.salon.pictures is nil")}
        topBarView.fillPicture(pictures)
    }
}
extension SalonDetailViewController: ViewInitilizeProtocol {
    func addSubviews() {
        [topBarView, infoView].forEach { view.addSubview($0)}
    }
    
    func setupConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()

        topBarView.addConstaintsToHorizontal()
        layoutConstraints += [
            topBarView.topAnchor.constraint(equalTo: view.topAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        infoView.addConstaintsToHorizontal()
        layoutConstraints += [
            infoView.topAnchor.constraint(equalTo: topBarView.bottomAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func stylizeViews() {
        view.backgroundColor = .white
    }
}
