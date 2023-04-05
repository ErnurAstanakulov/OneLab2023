//
//  InstrumentViewModel.swift
//  SimpleMVC
//
//  Created by Yernur on 05.04.2023.
//

import Foundation

protocol InstrumentViewModelProtocol {
    var didShowInstrument: ((InstrumentViewModelProtocol) -> Void)? { get set }
    func setInstrument()
    var guitar: Instrument? { get set }
}

final class InstrumentViewModel: InstrumentViewModelProtocol {
    var guitar: Instrument? {
        didSet {
            didShowInstrument?(self)
        }
    }
    var didShowInstrument: ((InstrumentViewModelProtocol) -> Void)?
    
    func setInstrument() {
        guitar = Instrument().getGuitar()
    }
}
