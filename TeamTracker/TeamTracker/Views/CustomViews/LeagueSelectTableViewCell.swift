//
//  LeagueSelectTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/1/21.
//

import UIKit

class LeagueSelectTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var leagueImageView: UIImageView!
    
    @IBOutlet weak var leagueTextLabel: UILabel!
    
    // MARK: - Lifecycle
    
    
    
    // MARK: - Properties
    var league: RegionLeague? {
        didSet {
            updateViews()
            updateForLol()
        }
    }
    
    var csLeague: String? {
        didSet {
            updateViews()
            updateForCS()
        }
    }
    
    
    
    // MARK: - Functions
    func updateViews(){
        self.contentView.backgroundColor = Colors.customDarkGray
        styleOutlets()
    }
    
    func updateForLol(){
        guard let image = league?.urlImage,
              let name = league?.name else {return}
        GlobalFns.displayPicture(url: image, UIImageView: leagueImageView)
        leagueTextLabel.text = name
    }
    
    func updateForCS(){
        leagueImageView.image = UIImage(named: "CSIcon")
        leagueTextLabel.text = csLeague
    }
    
    func styleOutlets(){
        leagueTextLabel.textColor = Colors.lightTextColor
    }
}
