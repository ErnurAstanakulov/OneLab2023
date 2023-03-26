


////  ======== Numbers, Data, and Basic Values =====


// NumberFormatter
import Foundation
//let number = 1505000
//var formattedWithDecimalSeparator: String = Formatter().withCurrencySeparator.string(from: NSNumber(value: number)) ?? ""
//
//var formattedWithPercentSeparator: String = {
//    let numberFormatter = NumberFormatter()
//    numberFormatter.numberStyle = .percent
//    numberFormatter.maximumIntegerDigits = 8
//    return numberFormatter.string(from: NSNumber(value: number)) ?? ""
//}()
//// 1 505 000.00
//print(formattedWithDecimalSeparator)
//print(formattedWithPercentSeparator)

// Data
//var data = Data([0x00, 0x01, 0x02, 0x03])
//
//print(data[2]) // 2

//data[2] = 0x09
//
//print (data == Data([0x00, 0x01, 0x09, 0x03])) // true
//
//var variable = 256
//
//let data = Data(buffer: UnsafeBufferPointer(start: &variable, count: 1))
// Creates a new buffer pointer over the specified number of contiguous instances beginning at the given pointer.

//print(data) // : <00010000 00000000>
//let cafe: Data? = "Cafe".data(using: .utf8) // non-nil
//String(decoding: cafe!, as: UTF8.self) // "Cafe"
//// writing image to disk
//import UIKit
//let imageToSave = #imageLiteral(resourceName: "IMG_2333.JPG")
//let jpegData = imageToSave.jpegData(compressionQuality: 1.0)
//let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//do {
//  try jpegData?.write(to: file!.appendingPathComponent("sleeping_dog.jpg")) //4
//} catch(let err) {
//  print(err.localizedDescription) //5
//}
//
//let jsonToUpload = """
//{"books":[{"title":"The Three Musketeers","author":"Dumas"}]}
//"""
//let jsonAsData = jsonToUpload.data(using: .utf8)
//let encodedString = jsonAsData?.base64EncodedString()
//let compressedString = try? NSData(data: (encodedString?.data(using: .utf8))!).compressed(using: .zlib) as Data
//print(compressedString ?? "")
//
//// URL components
//var url: URL? {
//    var components = URLComponents()
//    components.scheme = "https"
//    components.host = "api.github.com"
//    components.path = "/search/repositories"
//    components.queryItems = [
//        URLQueryItem(name: "q", value: "query"),
//        URLQueryItem(name: "sort", value: "yes")
//    ]
//    return components.url
//}
//print("url", url)


//let uuid = UUID().uuidString
//print(uuid)

// NSEdgeInsets
//let insets = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
// let someLabel.contentInset = insets

// NSRange / Range
//let range: ClosedRange = 0...10
//print(range.first!) // 0
//print(range.last!) // 10
////
//let names = ["Antoine", "Maaike", "Jaap"]
//let range: CountableClosedRange = 0...2
//print(names[range]) // ["Antoine", "Maaike", "Jaap"]
//print(names[0...2]) // ["Antoine", "Maaike", "Jaap"]
//
//let range: Range = 0..<10
//print(range.first!) // 0
//print(range.last!) // 9
//print(names[...2]) // ["Antoine", "Maaike", "Jaap"]
//print(names[1...]) // ["Maaike", "Jaap"]

//let names = ["Antoine", "Maaike", "Jaap"]
//let neededNames = 2
//var collectedNames: [String] = []
//for index in 0... {
//    guard collectedNames.count != neededNames else { break }
//    collectedNames.append(names[index])
//}
//print(collectedNames) // ["Antoine", "Maaike"]

//let emojiText: NSString = "?launcher"
//print(emojiText.substring(with: NSRange(location: 0, length: 2)))
//let emojiText = "?launcher"
//let endIndex = emojiText.index(emojiText.startIndex, offsetBy: 2)
//let range: Range<String.Index> = emojiText.startIndex..<endIndex
//print(emojiText[range]) // ?l


////  ======== Strings and Text  =====


// String with metadata
// create attributed string
//import UIKit
//import PlaygroundSupport
//let myString = "Swift Attributed String"
//let myAttribute = [NSAttributedString.Key.foregroundColor : UIColor.red]
//let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
//
//let label = UILabel()
//label.attributedText = myAttrString
//import PlaygroundSupport
//PlaygroundPage.current.liveView = label

//// Initialize with a string and separately declared attribute(s)
//let myAttributes2 = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]
//let mutableAttrString4 = NSMutableAttributedString(string: "Hello.", attributes: myAttributes2)
//mutableAttrString4.append(myAttrString)
//let label = UILabel()
//label.attributedText = mutableAttrString4
//import PlaygroundSupport
//PlaygroundPage.current.liveView = label

// Scanner
// 1.
//let hyphen = CharacterSet(charactersIn: "-")
//
//// 2.
//let scanner = Scanner(string: "123-4-56-7890")
//scanner.charactersToBeSkipped = hyphen
////
//// 3.
//var areaCode, firstThreeDigits, lastFourDigits: String?
//
//areaCode = scanner.scanUpToCharacters(from: hyphen)
//firstThreeDigits = scanner.scanUpToCharacters(from: hyphen)  // B
//lastFourDigits = scanner.scanUpToCharacters(from: hyphen)  // C
//
//print(lastFourDigits!)
// 123 - area code
//// 456 - first three digits
//// 7890 - last four digits

//// 1.
//let text = """
//Another example of parsing unstructured data is finding keywords in a given body of text. Your search strategy is to look at every word and check it against a set of keywords to see if it matches. You’ll use the whitespace and newline characters to take the words in the message as scanning. printers video
//
//"""
//let keywords: Set<String> = ["apple", "macs", "software", "keyboard",
//                             "printers", "printer", "video", "monitor",
//                             "laser", "scanner", "disks", "cost", "price",
//                             "floppy", "card", "phone"]
//
///// Return a set of keywords extracted from
//func keywordsByExtractingFrom(_ string: String) -> Set<String> {
//  // 2.
//  var results: Set<String> = []
//
//  // 3.
//  let scanner = Scanner(string: string)
//
//  // 4.
//    while !scanner.isAtEnd, let word = scanner.scanUpToString(" ")?.lowercased()  {
//    if keywords.contains(word) {
//      results.insert(word)
//    }
//  }
//
//  return results
//}

//print(keywordsByExtractingFrom(text))

//// Regular expressions
//do {
//    let input = "My name is Taylor Swift"
//    let regex = try NSRegularExpression(pattern: "My name is (.*)", options: NSRegularExpression.Options.caseInsensitive)
//    let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
//
//    print(matches.count)
//    if let match = matches.first {
//        let range = match.range(at:1)
//        if let swiftRange = Range(range, in: input) {
//            let name = input[swiftRange]
//            print(name)
//        }
//    }
//} catch {
//    // regex was bad!
//}
// NSDataDetector
//let input = "This is a test with the URL https://www.hackingwithswift.com to be detected."
//let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
//let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
//
//for match in matches {
//    guard let range = Range(match.range, in: input) else { continue }
//    let url = input[range]
//    print(url)
//}

// NSLOCALE
//let s1 = (Locale(identifier:"de") as NSLocale).displayName(forKey: .currencySymbol, value: "USD")!
//print(s1) // $



////  ======== Collections =====


// let image = #imageLiteral(resourceName: "Screen Shot 2023-03-24 at 12.09.36.png")
//let set = NSCountedSet()
//set.add("Bob")
//set.add("Charlotte")
//set.add("John")
//set.add("Bob")
//set.add("James")
//set.add("Sophie")
//set.add("Bob")
//
//print(set)
//print(set.count(for: "Bob"))

//var mySet: Set<Int> = [1,2,3,4,5]
//var myOrderedSet = NSMutableOrderedSet(array: [1,2,3,4,5])
//
//mySet.forEach  { print($0) }
//
//print("\n my ordered set: ")
//myOrderedSet.add(21)
//myOrderedSet.forEach { print($0) }
// NSCache
//import UIKit
//let cache = NSCache<NSString, UIImage>()
//cache.name = "Remote Image Cache"
//// save
//let webImage = #imageLiteral(resourceName: "IMG_2333.JPG")
//cache.setObject(webImage, forKey: "top banner")
//// retrive
//if let webImage = cache.object(forKey: "top banner ") {
//        // Do something with webImage
//    print("The object is still cached")
//} else {
//    print("Web image went away")
//}


////  ======== Dates && Time =====

//let now = Date()
//print("Current date/time: \(now)")
//
//let timestamp = Date().timeIntervalSince1970
//print("Number of seconds since ref date: \(timestamp)")
//
//let dtFormatter = DateFormatter()
//dtFormatter.dateStyle = .medium
//dtFormatter.timeStyle = .medium
//
//let formattedDateTime = dtFormatter.string(from: now)
//print(formattedDateTime)
////
//let dtFormatter = DateFormatter()
//dtFormatter.locale = Locale(identifier: "en_GB")
//dtFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")
//let date = dtFormatter.string(from: Date())
//print(date)
//
//let formattedDateTime = dtFormatter.string(from: now)
//print(formattedDateTime)
//let dtFormatter = DateFormatter()
//dtFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss Z"
//
//if let dt = dtFormatter.date(from: "01-03-2021 09:15:07 +0530") {
//    print(dt)
//}
//let timeZone = TimeZone.current
//print(timeZone)
//let now = Date()
//let dtFormatter = ISO8601DateFormatter()
//let formattedDateTime = dtFormatter.string(from: now)
//print(formattedDateTime)
//
//let now = DateComponents(calendar: Calendar.current, year: 2021, month: 3, day: 1)
//if let dt = now.date, let later = Calendar.current.date(byAdding: .month, value: 1, to: dt) {
//    print(later)
//}


//  ======== Units and Measurement  =====


// Measurement from ios 10
//let heightFeet = Measurement(value: 6, unit: UnitLength.feet)
//let heightInches = heightFeet.converted(to: UnitLength.inches)
//let heightSensible = heightFeet.converted(to: UnitLength.meters)
//let heightAUs = heightFeet.converted(to: UnitLength.astronomicalUnits)
//
//// convert degrees to radians
//let degrees = Measurement(value: 180, unit: UnitAngle.degrees)
//let radians = degrees.converted(to: .radians)
//
//// convert square meters to square centimeters
//let squareMeters = Measurement(value: 4, unit: UnitArea.squareMeters)
//let squareCentimeters = squareMeters.converted(to: .squareCentimeters)
//
//// convert bushels to imperial teaspoons
//let bushels = Measurement(value: 6, unit: UnitVolume.bushels)
//let teaspoons = bushels.converted(to: .imperialTeaspoons)


////  ======== Filters && Sorting =====


////NSPredicate
//@objcMembers class Person: NSObject {
//    let firstName: String
//    let lastName: String
//    let age: Int
//
//    init(firstName: String, lastName: String, age: Int) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//    }
//
//    override var description: String {
//        return "\(firstName) \(lastName)"
//    }
//}
//
//let alice = Person(firstName: "Alice", lastName: "Smith", age: 24)
//let bob = Person(firstName: "Bob", lastName: "Jones", age: 27)
//let charlie = Person(firstName: "Charlie", lastName: "Smith", age: 33)
//let quentin = Person(firstName: "Quentin", lastName: "Alberts", age: 31)
//let people = [alice, bob, charlie, quentin] as NSArray
//
//let thirtiesPredicate = NSPredicate(format: "age <= 30")
//print(people.filtered(using: thirtiesPredicate))
////
//struct Country {
//  var name: String
//  var capital: String?
//  var visited = false
//}
//let france = Country(name: "France")
//let predicate = NSPredicate(format: "name BEGINSWITH[cd] %@", "france")
//print(predicate.evaluate(with: france))
//@objcMembers
//class Country: NSObject {
//    var name: String
//    var capital: String?
//    var visited = false
//
//    init(name: String, capital: String? = nil, visited: Bool = false) {
//        self.name = name
//        self.capital = capital
//        self.visited = visited
//    }
//}
//
//let france = Country(name: "France")
//let predicate = NSPredicate(format: "SELF BEGINSWITH[cd] %@", "fraNce")
//print(predicate.evaluate(with: france.name))
// NSExpression
//let mathExpression = NSExpression(format: "4 + 5 - 2*3")
//let mathExpression2 = NSExpression(format: "4 + 5 - 2**3")
//let unionSetExpression = NSExpression(forUnionSet: mathExpression, with: mathExpression2)
//print(mathExpression)
//let mathValue = mathExpression2.expressionValue(with: nil, context: nil)
//print(mathValue)
//var numericExpression = "sqrt(4 + 2 - 2)"
//let expression = NSExpression(format: numericExpression)
//var result = expression.expressionValue(with: nil, context: nil) as? Int
//print(result)
// NSSortDescriptor
//@objcMembers
//class Person: NSObject {
//    let firstName: String
//    let lastName: String
//    let age: Int
//
//    init(firstName: String, lastName: String, age: Int) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//    }
//
//    override var description: String {
//        return "\(firstName) \(lastName)"
//    }
//}
//let alice = Person(firstName: "Alice", lastName: "Smith", age: 24)
//let bob = Person(firstName: "Bob", lastName: "Jones", age: 27)
//let charlie = Person(firstName: "Charlie", lastName: "Smith", age: 33)
//let quentin = Person(firstName: "Quentin", lastName: "Alberts", age: 31)
//let people = [alice, bob, charlie, quentin]
//
//let firstNameSortDescriptor = NSSortDescriptor(key: "firstName", ascending: true, selector: nil)
//let lastNameSortDescriptor = NSSortDescriptor(key: "lastName", ascending: true, selector: nil)
//let ageSortDescriptor = NSSortDescriptor(key: "age", ascending: true)
////
//let sortedByAge = (people as NSArray).sortedArray(using: [ageSortDescriptor])
//print(sortedByAge)
