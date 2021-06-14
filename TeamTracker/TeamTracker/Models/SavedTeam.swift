//
//  SavedTeam.swift
//  TeamTracker
//
//  Created by James Lea on 5/31/21.
//

import Foundation

class SavedTeam: Codable {
    let name: String
    let image_url: String
    let game: String
    let teamID: Int
    
    init(name: String, image_url: String, game: String, teamID: Int) {
        self.name = name
        self.image_url = image_url
        self.game = game
        self.teamID = teamID
    }
}

extension SavedTeam: Equatable {
    static func == (lhs: SavedTeam, rhs: SavedTeam) -> Bool {
        return lhs.teamID == rhs.teamID
    }
}
