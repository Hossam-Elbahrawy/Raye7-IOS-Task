//
//  Request.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation
import Alamofire

class LeaguesRequests {
    
   static func getLeagues(_ callback: @escaping (Result<[League], Error>)-> Void)  {
        
        //Making HTTP request with getLegues configurations
        AF.request(Router.getLegues).responseData {(response: AFDataResponse<Data>) in
            
            switch response.result{
                
            case .success( let data):
                do {
                    //Parsing Json Data into an array of leagues
                    let parsedData = try JSONDecoder().decode( [String: [League]].self, from: data)
                    let leagues =  parsedData["leagues"]
                    //Callback function that returns array of leagues
                    callback(.success(leagues ?? []))
                } catch let error  {
                    //Callback function that returns parsing error
                    callback(.failure(error))
                }
                
            case .failure(let error):
                //callback function that returns request error
                callback(.failure(error))
                
            }
        }
    }
    
  static  func getLeagueDetails(id: String,_ callback: @escaping (Result<LeagueDetails, Error>)-> Void)  {
        
        //Making HTTP request with getLeagueDetails configurations
        AF.request(Router.getLeagueDetails(id: id )).responseData{(response: AFDataResponse<Data>) in
            
            switch response.result{
                
            case .success(let data):
                do {
                    //Parsing Json Data into an leagueDetails object
                    let parsedData = try JSONDecoder().decode([String: LeagueDetails].self, from: data)
                    //Callback function that returns leagueDetails object
                    let leagueDetails =  parsedData["leagues"]!
                    print(leagueDetails)
                    let dada = LeagueDetails()
                    callback(.success(dada))
                } catch let error {
                    //Callback function that returns parsing error
                    callback(.failure(error))
                }
                
            case .failure(let error):
                //callback function that returns request error
                callback(.failure(error))
            }
            
        }
    }
}
