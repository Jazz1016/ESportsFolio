//
//  SavedTeamController.swift
//  TeamTracker
//
//  Created by James Lea on 6/2/21.
//

import Foundation

class SavedTeamController {
    static let shared = SavedTeamController()
    
    var savedTeams: [SavedTeam] = []
    
    func saveTeam(name: String, image_url: String, game: String, teamID: Int){
        
        let newTeam = SavedTeam(name: name, image_url: image_url, game: game, teamID: teamID)
        
        print("newTeam name: \(newTeam.name) newTeam game: \(newTeam.game)")
        
        for i in savedTeams {
            if i.teamID == newTeam.teamID {
                print("Team already added")
                return
            }
        }
        self.savedTeams.append(newTeam)
        saveToPersistentStore()
    }
    
    func deleteTeam(savedTeam: SavedTeam){
        guard let teamIndex = savedTeams.firstIndex(of: savedTeam) else {return}
        
        print("\(savedTeam.name) was deleted")
        
        savedTeams.remove(at: teamIndex)
        
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    func createPersistentStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("TeamTracker.json")
        return fileURL
    }
    
    func saveToPersistentStore() {
        do {
            let data = try JSONEncoder().encode(savedTeams)
            try data.write(to: createPersistentStore())
        } catch {
            print("ERROR ENCODING SONGS")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: createPersistentStore())
            savedTeams = try JSONDecoder().decode([SavedTeam].self, from: data)
        } catch {
            print("ERROR LOADING SONGS")
        }
    }
}
