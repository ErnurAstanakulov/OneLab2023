import Foundation
import UIKit

var greeting = "Hello, playground"

//// SINGLETON
//class DataBaseService {
//    static let shared = DataBaseService()
//
//    var diskMemorySize: CGFloat {
//        set {
//            UserDefaults.standard.set(newValue, forKey: "diskMemorySize")
//        }
//        get {
//            return UserDefaults.standard.value(forKey: "diskMemorySize") as? CGFloat ?? 0.0
//        }
//    }
//
//    func read() -> String {
//        return "Object"
//    }
//}
//
//// UIApplication.shared
//class MockServiceDataBase {
//    func read() -> String {
//        return "foo"
//    }
//}
//
//DataBaseService.shared.diskMemorySize = 200.0
//"foo" == MockServiceDataBase().read()

// Factory
//
//protocol Card {
//    func issue()
//}
//
//class DebetCard: Card {
//    private let title: String = ""
//
//
//    func issue() {
//        print("issue DebitCard")
//    }
//}
//
//class CreditCard: Card {
//    func issue() {
//        print("issue CreditCard")
//    }
//}
//
//class MultiCard: Card {
//    func issue() {
//        print("issue MultiCard")
//    }
//}
//
//enum CardType {
//    case debet
//    case credit
//}
//
//
//class Factory {
//    static func makeCard(by type: CardType) -> Card {
//        switch type {
//        case .debet:
//            return DebetCard()
//        case .credit:
//            return CreditCard()
//        }
//    }
//}
//
////
//let factory = Factory.makeCard(by: .debet)
//factory.issue()
//// factory method
//
//protocol CardFactoty {
//    func create() -> Card
//}
//
//class DebetCardFactory: CardFactoty {
//    func create() -> Card {
//        return DebetCard()
//    }
//}
//
//class CreditCardFactory: CardFactoty {
//    func create() -> Card {
//        return CreditCard()
//    }
//}
//
//class MultiCardFactory: CardFactoty {
//    func create() -> Card {
//        return MultiCard()
//    }
//}
//
//let debetCardFactory = DebetCardFactory()
//debetCardFactory.create()
//
//let creditCardFactory = CreditCardFactory()
//creditCardFactory.create()
//
//
//let multiCardFactory = MultiCardFactory()
//multiCardFactory.create()

//// Strategy
protocol SalonCleaning {
    func clean()
}
protocol WheelCleaning {
    func clean()
}

class EconomySalonCleaning: SalonCleaning {
    func clean() {
        print("Soap Car")
        print("Rinse Car")
    }
}
class ComfortSalonCleaning: SalonCleaning {
    func clean() {
        print("Wax Car")
        print("Blow-Dry Car")
    }
}
class EconomyWheelCleaning: WheelCleaning {
    func clean() {
        print("Soap Wheel")
        print("Rinse wheel")
    }
}
class ComfortWheelCleaning: WheelCleaning {
    func clean() {
        print("Brush Wheel")
        print("Dry Wheel")
    }
}
//class CarWash {
//    enum CarLevel: Int {
//        case economy, comfort
//    }
//
//    func washCar(with level: CarLevel) {
//        switch level {
//        case .economy:
//            let economySalonCleaning = EconomySalonCleaning()
//            let economyWhelCleaning = EconomyWheelCleaning()
//            economySalonCleaning.clean()
//            economyWhelCleaning.clean()
//        case .comfort:
//            let economySalonCleaning = EconomySalonCleaning()
//            let comfortWhelCleaning = ComfortWheelCleaning()
//            economySalonCleaning.clean()
//            comfortWhelCleaning.clean()
//        }
//    }
//}
////
//let carWash = CarWash()
//carWash.washCar(with: .comfort)
//
//
//protocol Strategy {
//    func getWheelCleaning() -> WheelCleaning
//    func getSalonCleaning() -> SalonCleaning
//}
////
//class EconomyWash: Strategy {
//    func getWheelCleaning() -> WheelCleaning{
//        return EconomyWheelCleaning()
//    }
//    func getSalonCleaning() -> SalonCleaning {
//        return EconomySalonCleaning()
//    }
//}
//class ComfortWash: Strategy {
//    func getWheelCleaning() -> WheelCleaning {
//        return EconomyWheelCleaning()
//    }
//    func getSalonCleaning() -> SalonCleaning {
//        return ComfortSalonCleaning()
//    }
//}
//
//class ComfortWashPlus: Strategy {
//    func getWheelCleaning() -> WheelCleaning {
//        return ComfortWheelCleaning()
//    }
//    func getSalonCleaning() -> SalonCleaning {
//        return ComfortSalonCleaning()
//    }
//}
////
//class CarWash {
//    private let strategy: Strategy
//    init(strategy: Strategy) {
//        self.strategy = strategy
//    }
//
//    func wash() {
//        strategy.getSalonCleaning().clean()
//        strategy.getWheelCleaning().clean()
//    }
//}
//
////let economyWash = CarWash(strategy: EconomyWash())
////economyWash.wash()
////
////let comfortWash = CarWash(strategy: ComfortWash())
////comfortWash.wash()
//let comfortWashPlus = CarWash(strategy: ComfortWashPlus())
//comfortWashPlus.wash()

//// Facade

//class FruitShop {
//    func buyFruit() -> String {
//        return "FruitShop"
//    }
//}
//
//class MealShop {
//    func buyMeal() -> String {
//        return "MealShop"
//    }
//}
//
//class IceCreamShop {
//    func buyIceCream() -> String {
//        return "IceCreamShop"
//    }
//}
//
//class TextileShop {
//    func buyTexttile() -> String {
//        return "TextileShop"
//    }
//}
//
//protocol Facade {
//    func buy() -> String
//}
//
//class SupermarketFacade: Facade {
//    private let textileShop = TextileShop()
//    private let iceCreamShop = IceCreamShop()
//    private let mealShop = MealShop()
//    private let fruitShop = FruitShop()
//
//    func buy() -> String {
//        var items: String = ""
//        items += textileShop.buyTexttile() + ", "
//        items += iceCreamShop.buyIceCream() + ", "
//        items += mealShop.buyMeal() + ", "
//        items += fruitShop.buyFruit() + ", "
//        return items
//    }
//}
//
//let supermarket = SupermarketFacade()
//print(supermarket.buy())
//
//// decorator

//protocol Porsche {
//    func getPrice() -> Double
//    func getDescription() -> String
//}
//
//class Boxter: Porsche {
//    func getPrice() -> Double {
//        return 120.000
//    }
//
//    func getDescription() -> String {
//        return "Porche Boxter"
//    }
//}
//
//class DecoratorPorsche: Porsche {
//    private let porche: Porsche
//    required init(porche: Porsche) {
//        self.porche = porche
//    }
//
//    func getPrice() -> Double {
//        return porche.getPrice()
//    }
//
//    func getDescription() -> String {
//        return porche.getDescription()
//    }
//}
//
//class PremiumAudioSystem: DecoratorPorsche {
//    override func getPrice() -> Double {
//        return super.getPrice() + 30.000
//    }
//
//    override func getDescription() -> String {
//        return super.getDescription() + " with Premium audio system"
//    }
//}
//
//class PanaromicSunroof: DecoratorPorsche {
//    override func getPrice() -> Double {
//        return super.getPrice() + 20.000
//    }
//
//    override func getDescription() -> String {
//        return super.getDescription() + " with panaromic sunroof"
//    }
//}
//
//var porche: Porsche = Boxter()
//porche.getDescription()
//porche.getPrice()
//
//porche = PanaromicSunroof(porche: porche)
//porche.getPrice()
//porche.getDescription()
//porche = PremiumAudioSystem(porche: porche)
//porche.getDescription()
//porche.getPrice()
//
///// Observer
protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(with string: String)
}

class Teacher: Subject {
    var observerCollection = NSMutableSet()
    var homeTask = "" {
        didSet {
            notify(with: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }

    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }

    func notify(with string: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
}

protocol PropertyObserver {
    func didGet(newTask task: String)
}

class Pupil: PropertyObserver {
    var homeTask = ""
    func didGet(newTask task: String) {
        homeTask = task
    }
}

let teacher = Teacher()
let pupil = Pupil()
teacher.add(observer: pupil)
teacher.homeTask = "Task number 3,5 on page 21"
print(pupil.homeTask)
