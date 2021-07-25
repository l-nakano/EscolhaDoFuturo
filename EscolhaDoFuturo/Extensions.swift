import Foundation

extension Formatter {
    static let number = NumberFormatter()
}

extension Locale {
    static let portuguesBR: Locale = .init(identifier: "pt_BR")
}

extension Numeric {
    func formatted(style: NumberFormatter.Style, locale: Locale = .current) -> String {
        Formatter.number.locale = locale
        Formatter.number.numberStyle = style
        return Formatter.number.string(for: self) ?? ""
    }
    var currencyBR: String { formatted(style: .currency, locale: .portuguesBR) }
}
