//
//  StandingsViewController.swift
//  TeamTracker
//
//  Created by James Lea on 6/9/21.
//

import UIKit

class StandingsViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var standingsListTableView: UITableView!
    @IBOutlet weak var tournamentImageView: UIImageView!
    @IBOutlet weak var tournamentNameLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        standingsListTableView.dataSource = self
        standingsListTableView.delegate = self
        updateOutlets()
        styleOutlets()
    }
    
    // MARK: - Properties
    var tournament: Tournament? {
        didSet {
            
        }
    }
    
    var standings: [Standing]? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Functions
    func updateViews(){
        DispatchQueue.main.async {
            self.standingsListTableView.reloadData()
        }
    }
    
    func updateOutlets(){
        GlobalFns.displayPicture(url: tournament?.league?.image_url ?? "", UIImageView: tournamentImageView)
        
        tournamentNameLabel?.text = "\(tournament?.league?.name ?? "") \(tournament?.serie?.full_name ?? "") \(tournament?.name ?? "")"
    }
    
    func styleOutlets(){
        self.view.backgroundColor = Colors.customDarkGray
        standingsListTableView.backgroundColor = Colors.customDarkGray
        tournamentNameLabel.textColor = Colors.lightTextColor
    }
    
    
}//End of class

extension StandingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "standingCell") as? StandingTableViewCell
        
        let standing = standings?[indexPath.row]
        
        cell?.standing = standing
        
        return cell ?? UITableViewCell()
    }
}//End of extension
