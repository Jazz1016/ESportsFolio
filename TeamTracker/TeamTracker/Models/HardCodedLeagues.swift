//
//  HardCodedLeagues.swift
//  TeamTracker
//
//  Created by James Lea on 6/1/21.
//

import Foundation

class Region {
    let game: String
    var leagues: [RegionLeague]?
    
    init(game: String, leagues: [RegionLeague] = []){
        self.game = game
    }
}

class RegionLeague {
    let name: String
    let id: Int
    let urlImage: String
    init(name: String, id: Int, urlImage: String){
        self.name = name
        self.id = id
        self.urlImage = urlImage
    }
}
