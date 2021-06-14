//
//  PortfolioListViewController.swift
//  TeamTracker
//
//  Created by James Lea on 6/4/21.
//

import UIKit

class PortfolioListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var portfolioTableView: UITableView!
    @IBOutlet weak var headerMyTeamsLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portfolioTableView.delegate = self
        portfolioTableView.dataSource = self
        
        TeamSelectTableViewCell.delegateTwo = self
        
        portfolioTableView.backgroundColor = Colors.customDarkGray
        
        self.view.backgroundColor = Colors.customDarkGray
        
        SavedTeamController.shared.loadFromPersistentStore()
        
        headerMyTeamsLabel.textColor = Colors.lightTextColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        portfolioTableView.reloadData()
    }
    
    func reloadPortfolioTable(){
        self.portfolioTableView.reloadData()
    }
}//End of class


// MARK: - Extensions
extension PortfolioListViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SavedTeamController.shared.savedTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as? SavedTeamTableViewCell
        
        let savedTeam = SavedTeamController.shared.savedTeams[indexPath.row]
        
        cell?.savedTeam = savedTeam
        
        return cell ?? UITableViewCell()
    }
    
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let teamToDelete = SavedTeamController.shared.savedTeams[indexPath.row]
            
            SavedTeamController.shared.deleteTeam(savedTeam: teamToDelete)
            
            portfolioTableView.deleteRows(at: [indexPath], with: .fade)
        }
        portfolioTableView.reloadData()
    }
    
    
    /*
     // Override to support rearranging the table view.
     func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamMatchResultsVC" {
            guard let destination = segue.destination as? TeamMatchResultViewController,
                  let indexPath = portfolioTableView.indexPathForSelectedRow else {return}
            let teamID = SavedTeamController.shared.savedTeams[indexPath.row].teamID
            destination.teamID = teamID
        }
    }
}//End of extension

extension PortfolioListViewController: reloadPortfolioTable {
    func portfolioTableViewReloader(){
        self.reloadPortfolioTable()
    }
}
