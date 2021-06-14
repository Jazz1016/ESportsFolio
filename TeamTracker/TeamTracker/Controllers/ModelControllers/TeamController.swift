//
//  TeamController.swift
//  TeamTracker
//
//  Created by James Lea on 5/31/21.
//

import Foundation

class TeamController {
    static let shared = TeamController()
    
    let portfolioList: [Team] = []
    var tournamentList: [Tournament] = []
    
    
    
    func fetchLeagues(){
//        let baseURL = "https://api.pandascore.co/leagues/?token=H54-gq-t3PikAbH_zb53RXIqeNULZt5rGB4nKOrECSJZsuyztAY"
        //JAMLEA: May Just Hardcode Leagues in
    }
    
    func fetchTeamsFromLeagueRecentTournament(leagueID: Int, completion: @escaping (Result<[Team], TeamError>) -> Void){
        let baseURL = "https://api.pandascore.co/leagues/\(leagueID)/tournaments"
        
        var components = URLComponents(string: baseURL)
        let apiQuery = URLQueryItem(name: "token", value: Strings.LolToken)
        components?.queryItems = [apiQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetched Teams status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let tournaments = try JSONDecoder().decode([Tournament].self, from: data)
                
                guard let teams = tournaments[0].teams else {return completion(.failure(.noData))}
                
                completion(.success(teams))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    func fetchPlayersFromTeam(teamID: Int, completion: @escaping (Result<[Player], TeamError>) -> Void){
        //https://api.pandascore.co/players?token=H54-gq-t3PikAbH_zb53RXIqeNULZt5rGB4nKOrECSJZsuyztAY&filter[team_id]={TEAMID1097}
        let baseURL = "https://api.pandascore.co/players"
        
        var components = URLComponents(string: baseURL)
        let apiQuery = URLQueryItem(name: "token", value: Strings.LolToken)
        let teamQuery = URLQueryItem(name: "filter[team_id]", value: "\(teamID)")
        components?.queryItems = [apiQuery, teamQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Players fetched status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let players = try JSONDecoder().decode([Player].self, from: data)
                
                completion(.success(players))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    func fetchMatchesFromTeam(teamID: Int, completion: @escaping (Result<[Match], TeamError>) -> Void){
        //https://api.pandascore.co/teams/teamID/matches?token=H54-gq-t3PikAbH_zb53RXIqeNULZt5rGB4nKOrECSJZsuyztAY
        // JAMLEA: be sure seperate matches with null winner becaus they haven't been played yet
        let baseURL = "https://api.pandascore.co/teams/\(teamID)/matches"
        var components = URLComponents(string: baseURL)
        let apiQuery = URLQueryItem(name: "token", value: Strings.LolToken)
        
        components?.queryItems = [apiQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Matches fetched status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                
                let matches = try JSONDecoder().decode([Match].self, from: data)
                completion(.success(matches))
                
            } catch {
                completion(.failure(.thrownError(error)))
                
            }
        }.resume()
    }
    
    func fetchTournamentsFromTeam(teamID: Int, completion: @escaping (Result<[Tournament], TeamError>) -> Void){
        //https://api.pandascore.co/teams/1097/tournaments?token=H54-gq-t3PikAbH_zb53RXIqeNULZt5rGB4nKOrECSJZsuyztAY#Property
        // JAMLEA: Could get tricky to find ongoing vs finished because it breaks up group stages as tournament and their winner is null despite being complete may have to use end_at
        let baseURL = "https://api.pandascore.co/teams/\(teamID)/tournaments"
        var components = URLComponents(string: baseURL)
        let apiQuery = URLQueryItem(name: "token", value: Strings.LolToken)
        components?.queryItems = [apiQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Tournaments fetched status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let tournaments = try JSONDecoder().decode([Tournament].self, from: data)
                
                completion(.success(tournaments))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    func fetchStandingsFromTournament(tournamentID: Int, completion: @escaping (Result<[Standing], TeamError>) -> Void){
        //https://api.pandascore.co/tournaments/5704/standings?token=H54-gq-t3PikAbH_zb53RXIqeNULZt5rGB4nKOrECSJZsuyztAY
        let baseURL = "https://api.pandascore.co/tournaments/\(tournamentID)/standings"
        let apiQuery = URLQueryItem(name: "token", value: Strings.LolToken)
        var components = URLComponents(string: baseURL)
        components?.queryItems = [apiQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("Tournaments fetched status code: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                
                let standings = try JSONDecoder().decode([Standing].self, from: data)
                
                completion(.success(standings))
                
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    func fetchImageStringFromTeamId(teamID: Int, completion: @escaping (Result<Team, TeamError>) -> Void){
        let baseURL = "https://api.pandascore.co/teams/\(teamID)"
        
        let apiQuery = URLQueryItem(name: "token", value: Strings.LolToken)
        var components = URLComponents(string: baseURL)
        components?.queryItems = [apiQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let team = try JSONDecoder().decode(Team.self, from: data)
                completion(.success(team))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}
