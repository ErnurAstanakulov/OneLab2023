//
//  ViewController.swift
//  MemoryLeak
//
//  Created by Yernur on 16.04.2023.
//

import UIKit

// Квартирант
class Person {
    var name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        print("\(name) initialization")
    }

    deinit {
        print("\(name) deiniz")
    }
}

// Квартира
class Apartment {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String) { self.unit = unit }
    
    deinit {
        print("Квартира \(unit) освобождается")
    }
}

class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var john: Person?
        var unit3A: Apartment?
        
        john = Person(name: "John Appleesed") // 1 ARC
        unit3A = Apartment(unit: "3A")
        john?.apartment = unit3A
        unit3A?.tenant = john

        
                john = nil
                unit3A = nil

//
    }
}

