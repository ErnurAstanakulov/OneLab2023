//
//  MVPInstrumentViewController.swift
//  SimpleMVC
//
//  Created by Yernur on 05.04.2023.
//

import UIKit

protocol MVPInstrumentViewProtocol: AnyObject {
    func setInstrument(_ instrument: Instrument)
}

final class MVPInstrumentViewController: UIViewController {
    private let instrumentView = InstrumentView()
    var presenter: InstrumentPresenterProtocol?
  
    override func loadView() {
        super.loadView()
        view = instrumentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setInstrument()
    }
}

extension MVPInstrumentViewController: MVPInstrumentViewProtocol {
    func setInstrument(_ instrument: Instrument) {
        instrumentView.fullData(with: instrument)
    }
}
