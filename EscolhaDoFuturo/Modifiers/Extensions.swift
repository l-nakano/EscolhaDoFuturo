import UIKit

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

extension UIView {
    func blink() {
        self.alpha = 0.2
        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.alpha = 1.0}, completion: nil)
    }
    
    func appear() {
        self.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveLinear], animations: {self.alpha = 1.0}, completion: nil)
    }
}
