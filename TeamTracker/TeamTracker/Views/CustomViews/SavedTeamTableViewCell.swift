//
//  SavedTeamTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/2/21.
//

import UIKit

class SavedTeamTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var savedTeamImageView: UIImageView!
    
    @IBOutlet weak var savedTeamNameLabel: UILabel!
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    
    // MARK: - Properties
    var savedTeam: SavedTeam? {
        didSet {
            updateViews()
            updateViewBasedOnGame()
        }
    }
    
    // MARK: - Functions
    func updateViews(){
        guard let image = savedTeam?.image_url,
              let name = savedTeam?.name else {return}
        
        self.contentView.backgroundColor = Colors.customDarkGray
        
        self.savedTeamNameLabel.textColor = Colors.lightTextColor
        
        GlobalFns.displayPicture(url: image, UIImageView: savedTeamImageView)
        
        savedTeamNameLabel.text = name
    }
    
    func updateViewBasedOnGame(){
        if savedTeam?.game == "LoL" {
            gameImageView.image = UIImage(named: "LoLIcon")
        } else if savedTeam?.game == "CSGO" {
            gameImageView.image = UIImage(named: "CSIcon")
        }
    }
}
