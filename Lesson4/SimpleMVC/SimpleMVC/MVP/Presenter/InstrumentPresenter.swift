//
//  InstrumentPresenter.swift
//  SimpleMVC
//
//  Created by Yernur on 05.04.2023.
//

import Foundation

protocol InstrumentPresenterProtocol: AnyObject {
    init(view: MVPInstrumentViewProtocol)
    func setInstrument()
}

final class InstrumentPresenter: InstrumentPresenterProtocol {
    unowned let view: MVPInstrumentViewProtocol
    private let instrument = Instrument()
    
    init(view: MVPInstrumentViewProtocol) {
        self.view = view
    }
    
    func setInstrument() {
        let guitar = instrument.getGuitar()
        view.setInstrument(guitar)
    }
}

final class MockInstrumentPresenter: InstrumentPresenterProtocol {
    unowned let view: MVPInstrumentViewProtocol
    private let instrument = Instrument()
    
    init(view: MVPInstrumentViewProtocol) {
        self.view = view
    }
    
    func setInstrument() {
        let guitar = instrument.getGuitar()
        view.setInstrument(guitar)
    }
}
