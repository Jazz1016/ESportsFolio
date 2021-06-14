//
//  MatchTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/9/21.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var matchTitleLabel: UILabel!
    @IBOutlet weak var bestOfLabel: UILabel!
    
    @IBOutlet weak var firstTeamImageView: UIImageView!
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    @IBOutlet weak var firstTeamScoreLabel: UILabel!
    
    @IBOutlet weak var secondTeamImageView: UIImageView!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamScoreLabel: UILabel!
    
    // MARK: - Properties
    var match: Match? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Fns
    func updateViews(){
        self.contentView.backgroundColor = Colors.customDarkGray
        self.bestOfLabel.textColor = Colors.lightTextColor
        self.matchTitleLabel.textColor = Colors.lightTextColor
        self.firstTeamNameLabel.textColor = Colors.lightTextColor
        self.firstTeamScoreLabel.textColor = Colors.lightTextColor
        self.secondTeamNameLabel.textColor = Colors.lightTextColor
        self.secondTeamScoreLabel.textColor = Colors.lightTextColor
        if match?.opponents?.count ?? 0 > 1 {
            
            matchTitleLabel.text = "\(match?.name ?? "")"
            
            let attributedString = NSMutableAttributedString(string: "bo\(match?.number_of_games ?? 3)")
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            //Underline effect here
            
            bestOfLabel.attributedText = attributedString
            
            GlobalFns.displayPicture(url: match?.opponents?[0].opponent.image_url ?? "", UIImageView: firstTeamImageView)
            
            firstTeamNameLabel.text = match?.opponents?[0].opponent.name ?? ""
            
            firstTeamScoreLabel.text = "\(match?.results?[0].score ?? 0)"
            
            GlobalFns.displayPicture(url: match?.opponents?[1].opponent.image_url ?? "", UIImageView: secondTeamImageView)
            
            secondTeamNameLabel.text = match?.opponents?[1].opponent.name ?? ""
            
            secondTeamScoreLabel.text = "\(match?.results?[1].score ?? 0)"
        } else {
            self.contentView.isHidden = true
        }
        
    }
}
