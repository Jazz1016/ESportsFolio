//
//  StandingTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/9/21.
//

import UIKit

class StandingTableViewCell: UITableViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak var teamPlacingLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var staticWLabel: UILabel!
    @IBOutlet weak var staticLLabel: UILabel!
    @IBOutlet weak var teamWinsLabel: UILabel!
    @IBOutlet weak var teamLossesLabel: UILabel!
    
    
    // MARK: - Properties
    var standing: Standing? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    func updateViews(){
        updateRank()
        stylingOutlets()
        updateWinsLosses()
        GlobalFns.displayPicture(url: standing?.team?.image_url ?? "", UIImageView: teamImageView)
        
        teamNameLabel.text = standing?.team?.name
        
    }
    
    func updateRank(){
        guard let rank = standing?.rank else {return}
        
        teamPlacingLabel.text = "\(rank)"
    }
    
    func updateWinsLosses(){
        guard let wins = standing?.wins,
              let losses = standing?.losses else {
            staticWLabel.text = ""
            staticLLabel.text = ""
            return}
        
        teamWinsLabel.text = "\(wins)"
        teamLossesLabel.text = "\(losses)"
    }
    
    func stylingOutlets(){
        self.contentView.backgroundColor = Colors.customDarkGray
        teamPlacingLabel.textColor = Colors.lightTextColor
        teamNameLabel.textColor = Colors.lightTextColor
        staticWLabel.textColor = Colors.lightTextColor
        staticLLabel.textColor = Colors.lightTextColor
        teamWinsLabel.textColor = Colors.lightTextColor
        teamLossesLabel.textColor = Colors.lightTextColor
    }
}
