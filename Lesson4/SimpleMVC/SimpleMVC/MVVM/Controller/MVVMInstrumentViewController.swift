//
//  MVVMInstrumentViewController.swift
//  SimpleMVC
//
//  Created by Yernur on 05.04.2023.
//

import UIKit

final class MVVMInstrumentViewController: UIViewController {
    private let instrumentView = InstrumentView()
    var viewModel: InstrumentViewModelProtocol?
    
    override func loadView() {
        super.loadView()
        view = instrumentView
        viewModel = InstrumentViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel?.setInstrument()
    }
    
    private func bindViewModel() {
        viewModel?.didShowInstrument = { [unowned self] viewModel in
            guard let guitar = viewModel.guitar else { return }
            self.instrumentView.fullData(with: guitar)
        }
    }
}

extension UIViewController {
    func getInstrument() {
        
    }
}
