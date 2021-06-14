//
//  GameSelectModalTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/4/21.
//

import UIKit

class GameSelectModalTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var gameSelectImage: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    // MARK: - Properties
    var game: [String] = [] {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Functions
    func updateView(){
        self.contentView.backgroundColor = Colors.customDarkGray
        gameNameLabel.text = game[0]
        gameSelectImage.image = UIImage(named: game[1])
        
        gameNameLabel.textColor = Colors.lightTextColor
    }
    
}//End of class
