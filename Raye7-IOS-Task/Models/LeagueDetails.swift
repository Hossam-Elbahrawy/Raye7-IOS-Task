//
//  LeagueDetails.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/1/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation


struct LeagueDetails: Decodable {
    
    var name: String
    var sport: String
    var country: String
    var logoImg: String
    var description: String
    
}
