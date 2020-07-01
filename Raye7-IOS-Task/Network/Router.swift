//
//  Router.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/1/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getLegues
    case getLeagueDetails(String)
    
    
    var url: URL {
        switch self {
        case .getLegues:
            return URL(string: "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php")!
        case .getLeagueDetails(let id):
            return URL(string: "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(id)")!
        }
    }
    var method: HTTPMethod{
        switch self {
        case .getLegues:
            return .get
        case .getLeagueDetails:
            return .get
      
        }
    }
    
    func asURLRequest() throws -> URLRequest {
    
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return urlRequest
    }
    
    
}
