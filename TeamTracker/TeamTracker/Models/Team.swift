//
//  Team.swift
//  TeamTracker
//
//  Created by James Lea on 5/30/21.
//

import Foundation

struct Team: Codable {
    let acronym: String?
    let current_videogame: Game?
    let id: Int?
    let image_url: String?
    let location: String?
    let name: String
    let slug: String
    let players: [Player]?
}

struct Game: Codable {
    var id: Int
    let name: String
    let slug: String
}

struct Player: Codable {
    let id: Int
    let birth_year: Int?
    let first_name: String
    let name: String
    let last_name: String
    let nationality: String?
    let role: String?
    let slug: String?
    let current_team: Team?
    let current_videogame: Game?
}

struct Tournament: Codable {
    let id: Int
    let league_id: Int?
    let name: String?
    let rosters: [Team]?
    let teams: [Team]?
    let matches: [Match]?
    let videogame: Game
    let winner_id: Int?
//    let winner_type: String?
    let serie: Serie?
    let league: League?
}

struct Match: Codable {
    let id: Int
    let name: String
    let begins_at: String?
//    let streams: [Stream]?
//    struct Stream: Codable {
//        let english: Language?
//        let official: Language?
//        struct Language: Codable {
//            let embed_url: String?
//            let raw_url: String?
//        }
//    }
    let opponents: [Opponent]?
    struct Opponent: Codable {
        let opponent: Team
        let type: String
    }
    let results: [Resilt]?
    let winner_id: Int?
    let tournament_id: Int?
    let match_type: String?
    let number_of_games: Int?
    let slug: String?
}

struct League: Codable {
    let id: Int
    let image_url: String
    let name: String
    let slug: String
}

struct Standing: Codable {
    let last_match: Match?
    let rank: Int?
    let team: Team?
    let wins: Int?
    let losses: Int?
    let total: Int?
}

struct Serie: Codable {
    let begin_at: String?
    let end_at: String?
    let full_name: String?
    let id: Int
    let league_id: Int?
    let season: String?
    let tier: String?
    let year: Int?
}

struct Resilt: Codable {
    let score: Int
    let team_id: Int
}
