//
//  Extension+COlor.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 06/05/25.
//

import SwiftUI


extension Color {
    init(_ hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgb: UInt64 = 0
        Scanner(string: hex.hasPrefix("#") ? String(hex.dropFirst()) : hex).scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(.sRGB, red: r, green: g, blue: b)
    }
}
