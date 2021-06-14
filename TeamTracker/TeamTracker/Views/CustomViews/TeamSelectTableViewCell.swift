//
//  TeamSelectTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/2/21.
//

import UIKit

// MARK: - Protocol
protocol routeBackToPortfolio: AnyObject {
    func route()
}

protocol reloadPortfolioTable: AnyObject {
    func portfolioTableViewReloader()
}

class TeamSelectTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var TeamNameLabel: UILabel!
    @IBOutlet weak var addTeamButton: UIButton!
    
    // MARK: - Lifecycle
    
    
    // MARK: - Properties
    var team: Team? {
        didSet {
            updateViews()
            styleElements()
        }
    }
    
    static weak var delegate: routeBackToPortfolio?
    
    static weak var delegateTwo: reloadPortfolioTable?
    
    var game: String?
    var homeView: UITableViewController?
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        saveTeam()
        TeamSelectTableViewCell.delegate?.route()
        TeamSelectTableViewCell.delegateTwo?.portfolioTableViewReloader()
    }
    
    // MARK: - Functions
    func updateViews(){
        guard let image = team?.image_url,
              let name = team?.name else {return}
        GlobalFns.displayPicture(url: image, UIImageView: teamImageView)
        
        TeamNameLabel.text = name
        
    }
    
    func styleElements(){
        self.contentView.backgroundColor = Colors.customDarkGray
        self.TeamNameLabel.textColor = Colors.lightTextColor
        self.addTeamButton.tintColor = Colors.lightTextColor
        self.addTeamButton.layer.shadowColor = UIColor.lightGray.cgColor
        self.addTeamButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = addTeamButton.bounds
        gradientBackground.startPoint = CGPoint(x: 0.9, y: 0.9)
        gradientBackground.endPoint = CGPoint(x: 1, y: 1)
        gradientBackground.colors = [Colors.customBlue?.cgColor ?? UIColor.blue.cgColor, UIColor.white.cgColor ]
        addTeamButton.layer.addSublayer(gradientBackground)
        //        self.addTeamButton.layer
        self.addTeamButton.layer.shadowRadius = 0.25
//        self.addTeamButton.layer.shadowOpacity = 1
        self.addTeamButton.addCornerRadius()
        self.addTeamButton.clipsToBounds = true
    }
    
    func saveTeam(){
        
        guard let image = team?.image_url,
              let name = team?.name,
              let teamId = team?.id,
              let game = game else {return}
        SavedTeamController.shared.saveTeam(name: name, image_url: image, game: game, teamID: teamId)
        
        homeView?.navigationController?.popToRootViewController(animated: true)
    }
}//End of class

