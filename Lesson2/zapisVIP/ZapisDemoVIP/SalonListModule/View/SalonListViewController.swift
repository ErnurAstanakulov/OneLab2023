//
//  SalonListViewController.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit

struct SalonList {
    var rows: [Fruit]
    let title: String
    let height: CGFloat
}

protocol SalonListViewProtocol {
    func setComponents(model: [SalonList])
}

protocol SelectedSalonDelegate {
    func openSalon(with id: Int)
}

class SalonListViewController: UIViewController, SalonListViewProtocol {
    
    func setComponents(model: [SalonList]) {
        salonListHeaders = model
        tableView.reloadData()
    }
    
    var interactor: SalonListInteractorProtocol?
    var router: SalonListRouterProtocol?
    
    private let tableView = UITableView()
    private lazy var salonListHeaders:[SalonList] = []

    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadLists()
    }
}

extension SalonListViewController: ViewInitilizeProtocol {
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.addConstaintsToFill()
    }
    
    func stylizeViews() {
        view.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.clear
    }
    
    func extraTasks() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SalonListTableCell.self, forCellReuseIdentifier: "SalonListTableCell")
    }
}
extension SalonListViewController: SelectedSalonDelegate {
    func openSalon(with id: Int) {
        router?.openSalonModule(with: id)
    }
}
extension SalonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return salonListHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SalonListTableCell") as? SalonListTableCell else {
            fatalError("SalonListTableCell not registred")
        }
        cell.models = salonListHeaders[indexPath.section].rows
        cell.setDelegate(self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return salonListHeaders[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return salonListHeaders[indexPath.section].height
    }
}

