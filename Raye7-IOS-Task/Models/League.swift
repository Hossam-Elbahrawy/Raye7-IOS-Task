//
//  League.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/1/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation
import RealmSwift

class League: Object, Decodable{
    
    @objc dynamic var id: String = ""
    @objc dynamic var shortName: String? = ""
    @objc dynamic  var name: String? = ""
    @objc dynamic var sport: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "idLeague"
        case shortName = "strLeagueAlternate"
        case name = "strLeague"
        case sport = "strSport"
    }
    override static func primaryKey() -> String? {
      return "id"
    }
}
