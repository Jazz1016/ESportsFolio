//
//  TeamMatchResultViewController.swift
//  TeamTracker
//
//  Created by James Lea on 5/31/21.
//

import UIKit
import MaterialComponents

class TeamMatchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - Outlets
    @IBOutlet weak var tabBarContainer: UIView!
    
    @IBOutlet weak var segmentedViews: UIView!
    
    @IBOutlet weak var matchTableView: UITableView!
    
    @IBOutlet weak var tournamentsTableView: UITableView!
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSegmentControllers()
        MaterialTabBarViewController.delegate = self
        
        matchTableView.delegate = self
        matchTableView.dataSource = self
        tournamentsTableView.delegate = self
        tournamentsTableView.dataSource = self
        matchTableView.isHidden = false
        tournamentsTableView.isHidden = false
        
        self.segmentedViews.backgroundColor = Colors.customDarkGray
        self.view.backgroundColor = Colors.customDarkGray
        self.matchTableView.backgroundColor = Colors.customDarkGray
        self.tournamentsTableView.backgroundColor = Colors.customDarkGray
        self.tabBarContainer.backgroundColor = Colors.customDarkGray
        
    }
    
//    let matchesVC = MatchesViewController()
//    let tourneysVC = TournamentsViewController()
    var teamID: Int? {
        didSet {
            fetchMatches(teamID: teamID!)
            fetchTournaments(teamID: teamID!)
        }
    }
    var matches: [Match] = []
    var tournaments: [Tournament] = []

    // MARK: - Functions
    func showTourneysSegmented(){
        matchTableView.isHidden = true
        tournamentsTableView.isHidden = false
    }

    func showMatchesSegmented(){
        tournamentsTableView.isHidden = true
        matchTableView.isHidden = false
    }
    
    func fetchMatches(teamID: Int){
        DispatchQueue.main.async {
            TeamController.shared.fetchMatchesFromTeam(teamID: teamID) { result in
                switch result {
                case .success(let matches):
                    if matches.count > 20 {
                        let slicedMatches = Array(matches[1...20])
                        self.matches = slicedMatches
                    } else {
                        self.matches = matches
                    }
                    DispatchQueue.main.async {
                        self.matchTableView.reloadData()
                    }
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
            
        }
    }
    
    func fetchTournaments(teamID: Int){
        DispatchQueue.main.async {
            TeamController.shared.fetchTournamentsFromTeam(teamID: teamID) { result in
                switch result {
                case .success(let tourneys):
                    if tourneys.count > 10 {
                        let slicedTourneys = Array(tourneys[1...10])
                        self.tournaments = slicedTourneys
                    } else {
                        self.tournaments = tourneys
                    }
                    DispatchQueue.main.async {
                        self.tournamentsTableView.reloadData()
                    }
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
           
        }
    }
    
    // MARK: TableView Controls
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        var numberOfRows = 0
        switch tableView {
        case matchTableView:
            numberOfRows = matches.count
        case tournamentsTableView:
            numberOfRows = tournaments.count
        default:
            numberOfRows = 1
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case matchTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as? MatchTableViewCell

            let match = matches[indexPath.row]

            cell?.match = match
            
            return cell ?? UITableViewCell()
        case tournamentsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tournamentCell", for: indexPath) as? TournamentTableViewCell

            let tournament = tournaments[indexPath.row]

            cell?.tournament = tournament
            
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toStandingsVC" {
            guard let destination = segue.destination as? StandingsViewController,
                  let indexPath =   tournamentsTableView.indexPathForSelectedRow else {return}
            
            destination.tournament = tournaments[indexPath.row]
            
            let tournamentID = tournaments[indexPath.row].id
            
            DispatchQueue.main.async {
                TeamController.shared.fetchStandingsFromTournament(tournamentID: tournamentID) { result in
                    switch result {
                    case .success(let standings):
                        destination.standings = standings
                    case .failure(let error):
                        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    }
                }
            }
        }
    }
    
}//End of class

extension TeamMatchResultViewController: tabBarSwitched {
    func showTourneys(){
        showTourneysSegmented()
    }
    
    func showMatches(){
        showMatchesSegmented()
    }
}//End of extension
