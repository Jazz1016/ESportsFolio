//
//  HardCodedLeaguesController.swift
//  TeamTracker
//
//  Created by James Lea on 6/1/21.
//

import Foundation

class HardCodedLeaguesController {
    static var leagues: [RegionLeague] {
        
        let LEC = RegionLeague(name: "LEC", id: 4197, urlImage: "https://cdn.pandascore.co/images/league/image/4197/LEC-2019.png"
)
        
        let LCS = RegionLeague(name: "LCS", id: 4198, urlImage: "https://cdn.pandascore.co/images/league/image/4198/image.png"
)
        
        let LPL = RegionLeague(name: "LPL", id: 294, urlImage: "https://cdn.pandascore.co/images/league/image/294/220px-LPL_2020.png")
        
        let LCK = RegionLeague(name: "LCK", id: 293, urlImage: "https://cdn.pandascore.co/images/league/image/293/LCK_2021_logo.png")
        
//        let LJL = RegionLeague(name: "LJL", id: 2092, urlImage: "https://cdn.pandascore.co/images/league/image/2092/ljl-japan-j27k8oms.png"
//)
//
//        let VCS = RegionLeague(name: "VCS", id: 4141, urlImage: "https://cdn.pandascore.co/images/league/image/4141/_.png")
//
//        let PCS = RegionLeague(name: "PCS", id: 4288, urlImage: "https://cdn.pandascore.co/images/league/image/4288/PCS_logo_full.png"
//)
//
//        let LFL = RegionLeague(name: "LFL", id: 4292, urlImage: "https://cdn.pandascore.co/images/league/image/4292/1200px-LFL_Logo_2020.png"
//)
        
        
        return [LEC, LCS, LCK, LPL]
    }
}
