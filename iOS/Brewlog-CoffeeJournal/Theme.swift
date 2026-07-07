import SwiftUI

enum Theme {
    static let accent = Color(hex: "#8B5A2B")
    static let background = Color(hex: "#160F0A")
    static let card = Color(hex: "#160F0A").opacity(0.6)
    static let textPrimary = Color.white.opacity(0.95)
    static let textSecondary = Color.white.opacity(0.6)

    static let titleFont = Font.custom("Avenir Next", size: 28).weight(.bold)
    static let bodyFont = Font.custom("Avenir Next", size: 16)
    static let labelFont = Font.custom("Avenir Next", size: 13).weight(.medium)
}

extension Color {
    init(hex: String) {
        let h = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var int: UInt64 = 0
        Scanner(string: h).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255.0
        let g = Double((int >> 8) & 0xFF) / 255.0
        let b = Double(int & 0xFF) / 255.0
        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1.0)
    }
}
