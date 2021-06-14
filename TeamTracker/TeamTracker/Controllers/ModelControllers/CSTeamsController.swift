//
//  CSTeamsController.swift
//  TeamTracker
//
//  Created by James Lea on 6/6/21.
//

import Foundation

class CSTeamsController {
    static let shared = CSTeamsController()
    
    var leagueNames: [String] = ["Europe", "North America", "CIS", "Brazil"]
    
    var leagues: [[Team]] {
        return [EU, NA, CIS, BR]
    }
    
    var NA: [Team] {
        
        let EG = Team(acronym: "EG", current_videogame: nil, id: 126233, image_url: "https://cdn.pandascore.co/images/team/image/126233/10399.png", location: "US", name: "Evil Geniuses", slug: "evil-geniuses-csgo", players: nil)
        
        let Liquid = Team(acronym: nil, current_videogame: nil, id: 3213, image_url: "https://cdn.pandascore.co/images/team/image/3213/220px_team_liquidlogo_square.png", location: "US", name: "Liquid", slug: "liquid-cs-go", players: nil)
        
        let ExtraSalt = Team(acronym: nil, current_videogame: nil, id: 128428, image_url: "https://cdn.pandascore.co/images/team/image/128428/900px_extra_salt_infobox_image.png", location: "US", name: "Extra Salt", slug: "extra-salt", players: nil)
        
        let Triumph = Team(acronym: nil, current_videogame: nil, id: 126464, image_url: "https://cdn.pandascore.co/images/team/image/126464/triumph.png", location: "US", name: "Triumph", slug: "triumph-cs-go", players: nil)
        
        return [Liquid, EG, ExtraSalt, Triumph]
    }
    var EU: [Team] {
    
        let Vitality = Team(acronym: nil, current_videogame: nil, id: 3455, image_url: "https://cdn.pandascore.co/images/team/image/3455/team_vitality_2020.png", location: "FR", name: "Vitality", slug: "vitality-cs-go", players: nil)
        
        let BIG = Team(acronym: nil, current_videogame: nil, id: 3249, image_url: "https://cdn.pandascore.co/images/team/image/3249/BIG.png", location: "DE", name: "BIG", slug: "big", players: nil)
        
        let G2 = Team(acronym: nil, current_videogame: nil, id: 3210, image_url: "https://cdn.pandascore.co/images/team/image/3210/5995.png", location: "DE", name: "G2", slug: "g2", players: nil)
        
        let Astralis = Team(acronym: nil, current_videogame: nil, id: 3209, image_url: "https://cdn.pandascore.co/images/team/image/3209/ASTRALIS.png", location: "DK", name: "Astralis", slug: "astralis", players: nil)
        
        let Fnatic = Team(acronym: nil, current_videogame: nil, id: 3217, image_url: "https://cdn.pandascore.co/images/team/image/3217/220px_fnaticlogo_square.png", location: "GB", name: "fnatic", slug: "fnatic-cs-go", players: nil)
        
        let Faze = Team(acronym: nil, current_videogame: nil, id: 3212, image_url: "https://cdn.pandascore.co/images/team/image/3212/FAZE_CLAN.png", location: "US", name: "Faze", slug: "faze", players: nil)
        
        let OG = Team(acronym: nil, current_videogame: nil, id: 126584, image_url: "https://cdn.pandascore.co/images/team/image/126584/600px_og_rb_logo.png", location: nil, name: "OG", slug: "go-cs-go", players: nil)
        
        let Mousports = Team(acronym: nil, current_videogame: nil, id: 3240, image_url: "https://cdn.pandascore.co/images/team/image/3240/MOUSE.png", location: "DE", name: "mouseports", slug: "mousesports-cs-go", players: nil)
        
        let Complexity = Team(acronym: nil, current_videogame: nil, id: 3310, image_url: "https://cdn.pandascore.co/images/team/image/3310/600px_complexity_gaming_2019.png", location: "US", name: "Complexity", slug: "complexity", players: nil)
        
        let NIP = Team(acronym: nil, current_videogame: nil, id: 3218, image_url: "https://cdn.pandascore.co/images/team/image/3218/600px_ninjas_in_pyjamas_2021.png", location: "SE", name: "NIP", slug: "nip", players: nil)
        
        let Heroic = Team(acronym: nil, current_videogame: nil, id: 3246, image_url: "https://cdn.pandascore.co/images/team/image/3246/Heroic_2019_teamcardimage.png", location: "DK", name: "Heroic", slug: "heroic", players: nil)
        
        return [G2, Vitality, BIG, Astralis, Fnatic, Faze, OG, Mousports, Complexity, NIP, Heroic]
    }
    var CIS: [Team] {
        let Gambit = Team(acronym: nil, current_videogame: nil, id: 3214, image_url: "https://cdn.pandascore.co/images/team/image/3214/600px_gambit_2020.png", location: "RU", name: "Gambit", slug: "gambit", players: nil)
        
        let Spirit = Team(acronym: nil, current_videogame: nil, id: 124523, image_url: "https://cdn.pandascore.co/images/team/image/124523/900px_team_spirit_2021.png", location: "RU", name: "Spirit", slug: "spirit", players: nil)
        
        let Navi = Team(acronym: nil, current_videogame: nil, id: 3216, image_url: "https://cdn.pandascore.co/images/team/image/3216/NATUS_VINCERE.png", location: "UA", name: "Natus Vincere", slug: "natus-vincere-cs-go", players: nil)
        
        let VirtusPro = Team(acronym: nil, current_videogame: nil, id: 3288, image_url: "https://cdn.pandascore.co/images/team/image/3288/600px_virtus.pro_2019.png", location: "RU", name: "Virtus.pro", slug: "virtus-pro-75b4744b-43d9-4ebd-a8dc-f1e0f9be69b3", players: nil)
        
        let Forze = Team(acronym: nil, current_videogame: nil, id: 60201, image_url: "https://cdn.pandascore.co/images/team/image/60201/FORZE.png", location: "RU", name: "forZe", slug: "forze", players: nil)
        return [Navi, Gambit, Spirit, VirtusPro, Forze]
    }
    var BR: [Team] {
        let Furia = Team(acronym: nil, current_videogame: nil, id: 124530, image_url: "https://cdn.pandascore.co/images/team/image/124530/8297.png", location: "BR", name: "FURIA", slug: "furia", players: nil)
        
        let Pain = Team(acronym: nil, current_videogame: nil, id: 125751, image_url: "https://cdn.pandascore.co/images/team/image/125751/pain-gaming-farnhu45.png", location: "BR", name: "paiN", slug: "pain-gaming-cs-go", players: nil)
        
        let TeamOne = Team(acronym: nil, current_videogame: nil, id: 5793, image_url: "https://cdn.pandascore.co/images/team/image/5793/ONE.png", location: "BR", name: "TeamOne", slug: "team-one-cs-go", players: nil)
        return [Furia, Pain, TeamOne]
    }
    
    
    
}
