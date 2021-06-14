//
//  StyleGuide.swift
//  TeamTracker
//
//  Created by James Lea on 6/10/21.
//

import UIKit

extension UIView {
    func addCornerRadius(_ radius: CGFloat = 10){
        self.layer.cornerRadius = radius
    }
    func addAccentBorder(width: CGFloat = 1, color: UIColor = Colors.customOrange ?? .orange){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

struct Colors {
    static let customDarkGray = UIColor(named: "customDarkGray")
    static let customBlue = UIColor(named: "customBlue")
    static let customOrange = UIColor(named: "customOrange")
    static let lightTextColor = UIColor(named: "lightTextColor")
}


struct Gradients {
//    let gradientBackground = CAGradientLayer()
//    gradientBackground.frame      = view.bounds
//    gradientBackground.startPoint = CGPoint(x: 0, y: 0)
//    gradientBackground.endPoint   = CGPoint(x: 1, y: 1)
//    gradientBackground.colors     = [UIColor(named: "hpBlue")?.cgColor ?? UIColor.systemBlue.cgColor,
//    UIColor(named: "hpGreen")?.cgColor ?? UIColor.systemTeal.cgColor]
//    backgroundView.layer.addSublayer(gradientBackground)
}


struct FontNames {
    static let opulent = "opulent"
}
