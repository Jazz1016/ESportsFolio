//
//  LeagueSelectionTableViewController.swift
//  TeamTracker
//
//  Created by James Lea on 6/1/21.
//

import UIKit

class LeagueSelectionTableViewController: UITableViewController {


    @IBOutlet weak var backButtonView: UIView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.customDarkGray
        self.backButtonView.backgroundColor = Colors.customDarkGray
    }
    
    // MARK: - Properties
    var game: String = ""
    
    // MARK: - Actions
    @IBAction func backButtonWasTapped(_ sender: Any) {
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Functions
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return HardCodedLeaguesController.leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as? LeagueSelectTableViewCell
        
        if game == "LoL" {
            let league = HardCodedLeaguesController.leagues[indexPath.row]
            cell?.league = league
            
        } else if game == "CSGO" {
            let csLeague = CSTeamsController.shared.leagueNames[indexPath.row]
            
            cell?.csLeague = csLeague
        }
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTeamSelectVC" {
            guard let destination = segue.destination as? TeamSelectionTableViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            if game == "LoL" {
                destination.leagueID = HardCodedLeaguesController.leagues[indexPath.row].id
                
                destination.game = "LoL"
            } else if game == "CSGO" {
                destination.teams = CSTeamsController.shared.leagues[indexPath.row]
                
                destination.game = "CSGO"
            }
        }
    }

    
}//End of class
