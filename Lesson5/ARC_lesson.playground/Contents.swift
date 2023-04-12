import UIKit

//var greeting = "Hello, playground"
//
//class DecimalNumber {
//    var value: Int
//
//    init(value: Int) {
//        self.value = value
//    }
//
//    deinit {
//        print("Объект c value \(value) удаляется")
//    }
//}
//
//var firstNum = DecimalNumber(value: 19)
//var secondNum = DecimalNumber(value: 22)
//
//// 1
//var num3 = secondNum
//// 2
//var num4 = secondNum
//
//// 1
//firstNum = num4
//
//
//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name) initialization")
//    }
//
//    deinit {
//        print("\(name) deiniz")
//    }
//}
//
//var ref1: Person? // 3
//var ref2: Person?
//var ref3: Person?
//
//ref1 = Person(name: "John Appleesed")
//ref2 = ref1
//ref3 = ref1
////
//// 2
//ref1 = nil
////// 1
//ref2 = nil
////// 0
//ref3 = nil


//
//// Квартирант
//class Person {
//    var name: String
//    var apartment: Apartment?
//    init(name: String) {
//        self.name = name
//        print("\(name) initialization")
//    }
//
//    deinit {
//        print("\(name) deiniz")
//    }
//}

// Квартира
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    unowned var tenant: Person?
//    deinit {
//        print("Квартира \(unit) освобождается")
//    }
//}
//// weak or unowned
//// create a objs
//
//var john: Person = Person(name: "John Appleesed") // 1 ARC
//var unit3A: Apartment = Apartment(unit: "3A")
////
////john = nil
////unit3A = nil
//
//
//// поселим жильца в кв
//john.apartment = unit3A
//unit3A.tenant = john // 1
////john = nil
////unit3A = nil
//
////john!.name = "Maria"
//unit3A.tenant = Person(name: "Maria Gilbert")
//
//class HTMLElement {
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = { [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name)/>"
//        }
//    }
//
//    init(name:String, text: String?) {
//        self.name = name
//        self.text = text
//    }
//    deinit {
//        print("\(name) deinitialization")
//    }
//}
//
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "some text")
//print(paragraph!.asHTML())
//
//paragraph = nil

/// KEYCHAIN
///
///
//import Foundation
//
//let serviceName = "kz.forte.app.qa"
//let apiKey = "c49c433a1c4f44faa063421a795d6abc"
//
//let attributes: [String: Any] = [
//    kSecClass as String: kSecClassGenericPassword,
//    kSecAttrService as String: serviceName,
//    kSecValueData as String: apiKey.data(using: .utf8)!
//]
//
//let result = SecItemAdd(attributes as CFDictionary, nil)
//
//if result == errSecSuccess {
//    print("Added item")
//} else {
//    print("Error adding item: \(result)")
//    if let msg = SecCopyErrorMessageString(result, nil) {
//        print(msg as String)
//    }
//}
