//
//  RealmManager.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/3/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation
import RealmSwift


class RealmManager {
    
    private static let realm = try! Realm()
    
    static func saveLeagues(leagues: [League]){
        try! realm.write {
            realm.add(leagues, update: .modified)
        }
    }
    
    static func readLeagues()->[League]{
        //Array of Results
        deleteExpiredData()
        let dbLeagues = realm.objects(League.self)
        var leagues = [League]()
        for dbLeague in dbLeagues{
            leagues.append(dbLeague)
        }
        return leagues
    }
    
    static func flushDb(){
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    static private func deleteExpiredData(){
        // Make data expiration date about an hour
        let expDate = NSDate(timeIntervalSinceNow: -( 1  * 60 * 60))
        let itemsToDelete =  realm.objects(League.self).filter("createdAt < %@",expDate)
        try! realm.write{
            realm.delete(itemsToDelete)
        }
    }
    
}
