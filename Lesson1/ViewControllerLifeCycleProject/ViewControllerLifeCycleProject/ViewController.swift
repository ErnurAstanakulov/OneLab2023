//
//  ViewController.swift
//  ViewControllerLifeCycleProject
//
//  Created by Yernur on 24.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init(nibName: nil, bundle: nil)
        print("init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit")
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        print("willTransition")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
        view = tableView
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
}
