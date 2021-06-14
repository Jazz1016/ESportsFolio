//
//  TournamentTableViewCell.swift
//  TeamTracker
//
//  Created by James Lea on 6/9/21.
//

import UIKit

class TournamentTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var tournamentImageView: UIImageView!
    @IBOutlet weak var tournamentNameLabel: UILabel!
    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet weak var teamWinnerLabel: UILabel!
    
    
    // MARK: - Properties
    var tournament: Tournament? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    func updateViews(){
        self.tournamentNameLabel.textColor = Colors.lightTextColor
        self.teamWinnerLabel.textColor = Colors.lightTextColor
        self.contentView.backgroundColor = Colors.customDarkGray
        tournamentNameLabel.text = "\(tournament?.league?.name ?? "") \(tournament?.serie?.full_name ?? "") \(tournament?.name ?? "")"
        
        GlobalFns.displayPicture(url: tournament?.league?.image_url ?? "", UIImageView: tournamentImageView)
        
        guard let winnerID = tournament?.winner_id else {winnerImageView.image = UIImage(named: "imageNotFound"); return}
        DispatchQueue.main.async {
            TeamController.shared.fetchImageStringFromTeamId(teamID: winnerID) { result in
                switch result {
                case .success(let team):
                    GlobalFns.displayPicture(url: team.image_url ?? "", UIImageView: self.winnerImageView)
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }
}
