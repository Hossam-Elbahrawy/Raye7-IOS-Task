//
//  LeagueDetails.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/1/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation


struct LeagueDetails: Decodable {
    
    var name: String?
    var sport: String?
    var country: String?
    var logoImg: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strLeague"
        case sport = "strSport"
        case country = "strCountry"
        case logoImg = "strLogo"
        case description = "strDescriptionEN"
    }
}
