//
//  ModalGameSelectViewController.swift
//  TeamTracker
//
//  Created by James Lea on 6/4/21.
//

import UIKit
class ModalGameSelectViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var gameSelectTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gameSelectTableView.delegate = self
        gameSelectTableView.dataSource = self
        
        gameSelectTableView.layer.cornerRadius = 10
        gameSelectTableView.layer.masksToBounds = true
        gameSelectTableView.backgroundColor = Colors.customDarkGray
        }
    
    // MARK: - Properties
    // Hardcoded List of games User can choose from
    
    var games = [["LoL", "LoLIcon"], ["CSGO", "CSIcon"]]
    
    
    // MARK: - Actions
    @IBAction func navPopButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}//End of class


extension ModalGameSelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameSelectModalCell") as? GameSelectModalTableViewCell
        
        let game = games[indexPath.row]
        
        cell?.game = game
        
        return cell ?? UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toLeagueSelectVC" {
            guard let destination = segue.destination as? LeagueSelectionTableViewController,
                  let indexPath = gameSelectTableView.indexPathForSelectedRow else {return}
            
            destination.game = games[indexPath.row][0]
        }
    }
}//End of extension
