//
//  TeamSelectionTableViewController.swift
//  TeamTracker
//
//  Created by James Lea on 6/1/21.
//



import UIKit

class TeamSelectionTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var backButtonView: UIView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeamSelectTableViewCell.delegate = self
        
        self.backButtonView.backgroundColor = Colors.customDarkGray
        self.view.backgroundColor = Colors.customDarkGray
    }
    
    
    // MARK: - Properties
    var leagueID: Int? {
        didSet {
            populateTeams()
            
        }
    }
    var teams: [Team] = []
    var game: String = ""
    
    // MARK: - Actions
    
    @IBAction func backButtonWasTapped(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamSelectCell", for: indexPath) as? TeamSelectTableViewCell
        
        let team = teams[indexPath.row]
        
        cell?.team = team
        cell?.homeView = self
        cell?.game = game
        
        
        return cell ?? UITableViewCell()
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
    // MARK: - Functions
    
    func routeBackToPortfolioVC(){
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func populateTeams(){
        guard let leagueID = leagueID else {return}
            TeamController.shared.fetchTeamsFromLeagueRecentTournament(leagueID: leagueID) { (result) in
                DispatchQueue.main.async {
                switch result {
                case .success(let teams):
                    self.teams = teams
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        }
    }

}//End of class

extension TeamSelectionTableViewController: routeBackToPortfolio {
    func route(){
        routeBackToPortfolioVC()
    }
}//End of extension
