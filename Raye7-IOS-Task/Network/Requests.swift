//
//  Request.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation
import Alamofire

class Requests {
    
    func getLeagues(_ callback: @escaping (Result<[League], Error>)-> Void)  {
        
        //Making HTTP request with getLegues configurations
        AF.request(Router.getLegues).responseData {(response: AFDataResponse<Data>) in
            
            switch response.result{
                
            case .success( let data):
                do {
                    //Parsing Json Data into an array of leagues
                    let leagues = try JSONDecoder().decode([League].self, from: data)
                    //Callback function that returns array of leagues
                    callback(.success(leagues))
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
    
    func getLeagueDetails(id: String,_ callback: @escaping (Result<LeagueDetails, Error>)-> Void)  {
        
        //Making HTTP request with getLeagueDetails configurations
        AF.request(Router.getLeagueDetails(id: id )).responseData{(response: AFDataResponse<Data>) in
            
            switch response.result{
                
            case .success(let data):
                do {
                    //Parsing Json Data into an leagueDetails object
                    let leagueDetails = try JSONDecoder().decode(LeagueDetails.self, from: data)
                    //Callback function that returns leagueDetails object
                    callback(.success(leagueDetails))
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
