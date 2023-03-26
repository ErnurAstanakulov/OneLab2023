import Foundation

public extension Formatter {
    var withCurrencySeparator: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
}
