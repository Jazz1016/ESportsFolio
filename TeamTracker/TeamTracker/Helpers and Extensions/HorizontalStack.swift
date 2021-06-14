//
//  HorizontalStack.swift
//  TeamTracker
//
//  Created by James Lea on 6/7/21.
//

import UIKit

class HorizontalStack: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("Something went horribly wrong")
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    func configure(){
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
}
